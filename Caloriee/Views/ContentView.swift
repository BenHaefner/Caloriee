//
//  ContentView.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/8/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @State var user: Profile?
    @State var day: Day?
    @State var initializeTask: String = ""
    @State var goal: Int?
    @State var settingGoal: Bool = false
    @State var stackPath: [FoodDetailNavigation] = []
    var body: some View {
        NavigationStack(path: $stackPath) {
            VStack {
                if user != nil || day != nil {
                    DayView(
                        user: user!, day: day!, stackPath: $stackPath,
                        onChangeDate: { date in
                            Task {
                                await reinitDate(for: date)
                            }
                        })
                } else if settingGoal {
                    GoalSettingView(
                        isEdit: false,
                        onSet: { newGoal in
                            self.goal = newGoal
                            self.settingGoal = false
                        })
                } else {
                    VStack {
                        Text(initializeTask)
                        ProgressView()
                            .task {
                                await initializeData()
                            }
                    }
                }
            }
            .navigationDestination(
                for: FoodDetailNavigation.self,
                destination: { foodDetailNav in
                    FoodDetailView(
                        foodItem: foodDetailNav.foodItem, creating: foodDetailNav.creating,
                        day: foodDetailNav.day)
                })
        }
    }

    private func initializeData() async {
        do {
            initializeTask = "Initializing profile..."
            let profiles = try context.fetch(FetchDescriptor<Profile>())
            let profile = profiles.first
            if profile != nil {
                self.user = profile!
            } else {
                if goal == nil {
                    settingGoal = true
                    return
                }
                self.user = Profile(calorieGoal: goal!)
                context.insert(self.user!)
                try context.save()
            }

            initializeTask = "Initializing day..."
            let today = Calendar.current.startOfDay(for: Date())
            let days = try context.fetch(
                FetchDescriptor<Day>(
                    predicate: #Predicate{ $0.date == today }
                ))
            let day = days.first
            if day != nil {
                self.day = day!
            } else {
                self.day = Day(date: today, foodItems: [])
                context.insert(self.day!)
                try context.save()
            }

            initializeTask = "Initializing food database..."
            var foods = FetchDescriptor<StoredFood>()
            foods.fetchLimit = 1
            let existingFoods = try context.fetch(foods)
            if existingFoods.isEmpty {
                if let url = Bundle.main.url(forResource: "USDA_FF_2025-04-24", withExtension: "json"),
                   let data = try? Data(contentsOf: url)
                {
                    let decoder = JSONDecoder()
                    let decodedFoods = try decoder.decode(CodableUsda.self, from: data)
                    let filteredDecodedFoods = try decodedFoods.foundationFoods!.filter(
                        #Predicate{
                            $0.foodNutrients.contains(where: {
                                $0.nutrient.unitName == "kcal"
                            })
                        })
                    let persistableFoods = filteredDecodedFoods.map {
                        StoredFood(
                            name: $0.description,
                            calories: Int(
                                ($0.foodNutrients.first(where: { $0.nutrient.unitName == "kcal" }))!.amount!),
                            portionWeight: $0.foodPortions?.first?.gramWeight, usdaId: $0.fdcID,
                            udsaSource: "FoundationFoods")
                    }
                    for food in persistableFoods {
                        context.insert(food)
                    }
                    try context.save()
                }
                if let url = Bundle.main.url(forResource: "USDA_FNDDS_2024_10", withExtension: "json"),
                   let data = try? Data(contentsOf: url)
                {
                    let decoder = JSONDecoder()
                    let decodedFoods = try decoder.decode(CodableUsda.self, from: data)
                    let filteredDecodedFoods = try decodedFoods.surveyFoods!.filter(
                        #Predicate{
                            $0.foodNutrients.contains(where: {
                                $0.nutrient.unitName == "kcal"
                            })
                        })
                    let persistableFoods = filteredDecodedFoods.map {
                        StoredFood(
                            name: $0.description,
                            calories: Int(
                                ($0.foodNutrients.first(where: { $0.nutrient.unitName == "kcal" }))!.amount),
                            portionWeight: $0.foodPortions.first?.gramWeight, usdaId: $0.fdcID,
                            udsaSource: "Survey")
                    }
                    for food in persistableFoods {
            context.insert(food)
          }
          try context.save()
        }
      }
    } catch {
      fatalError("Error retrieving initial data: \(error)")
    }
  }

    private func reinitDate(for date: Date) async {
        do {
            let newDate = Calendar.current.startOfDay(for: date)
            let days = try context.fetch(
                FetchDescriptor<Day>(
                    predicate: #Predicate{ $0.date == newDate }
                ))
            let day = days.first
            if day != nil {
                self.day = day!
            } else {
                self.day = Day(date: date, foodItems: [])
                context.insert(self.day!)
                try context.save()
            }
        } catch {
            fatalError("Error retrieving new date: \(error)")
        }
    }
}
