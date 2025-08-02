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
    @State var foodItems: [FoodItem]?
    @State var initializeTask: String = ""
    @State var goal: Int?
    @State var settingGoal: Bool = false
    @State var stackPath: [FoodDetailNavigation] = []
    var body: some View {
        NavigationStack(path: $stackPath) {
            VStack {
                if user != nil && day != nil && foodItems != nil {
                    DayView(
                        user: user!,
                        day: day!,
                        foodItems: Binding(get: { foodItems ?? [] }, set: { foodItems = $0 }),
                        stackPath: $stackPath,
                        onChangeDate: { date in
                            Task {
                                await reinitDate(for: date)
                            }
                        },
                        getFoodItemDataForDay: initFoodForDay)
                } else if settingGoal {
                    GoalSettingView(
                        isEdit: false,
                        onSet: { newGoal in
                            self.goal = newGoal
                            self.settingGoal = false
                        })
                } else {
                    VStack {
                        Text("Doing some set up...")
                        ProgressView()
                            .progressViewStyle(HeartSymbolProgressViewStyle())
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
                        foodItem: foodDetailNav.foodItem,
                        creating: foodDetailNav.creating,
                        day: foodDetailNav.day,
                        predismiss: initFoodForDay
                    )
                })
        }
    }

    private func initializeData() async {
        do {
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

            let today = Calendar.current.startOfDay(for: Date())
            await reinitDate(for: today)

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
                    var persistableFoods: [StoredFood] = []
                    filteredDecodedFoods.forEach { filteredDecodedFood in
                        if (filteredDecodedFood.foodPortions != nil && filteredDecodedFood.foodPortions!.count > 0) {
                            filteredDecodedFood.foodPortions!.forEach { foodPortion in
                                persistableFoods.append(StoredFood(
                                    name: filteredDecodedFood.description,
                                    calories: Int(
                                        (filteredDecodedFood.foodNutrients.first(where: { $0.nutrient.unitName == "kcal" }))!.amount!),
                                    portionName: "\(Int(foodPortion.amount).description) \(foodPortion.measureUnit.name)",
                                    portionWeight: foodPortion.gramWeight,
                                    usdaId: filteredDecodedFood.fdcID,
                                    udsaSource: "FoundationFoods"))
                            }
                        } else {
                            persistableFoods.append(StoredFood(
                                name: filteredDecodedFood.description,
                                calories: Int(
                                    (filteredDecodedFood.foodNutrients.first(where: { $0.nutrient.unitName == "kcal" }))!.amount!),
                                portionName: nil,
                                portionWeight: nil,
                                usdaId: filteredDecodedFood.fdcID,
                                udsaSource: "FoundationFoods"))
                        }
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
                    var persistableFoods: [StoredFood] = []
                    filteredDecodedFoods.forEach { filteredDecodedFood in
                        if (filteredDecodedFood.foodPortions.count > 0) {
                            filteredDecodedFood.foodPortions.forEach { foodPortion in
                                persistableFoods.append(StoredFood(
                                    name: filteredDecodedFood.description,
                                    calories: Int(
                                        (filteredDecodedFood.foodNutrients.first(where: { $0.nutrient.unitName == "kcal" }))!.amount),
                                    portionName: foodPortion.portionDescription,
                                    portionWeight: foodPortion.gramWeight,
                                    usdaId: filteredDecodedFood.fdcID,
                                    udsaSource: "Survey"))
                            }
                        } else {
                            persistableFoods.append(StoredFood(
                                name: filteredDecodedFood.description,
                                calories: Int(
                                    (filteredDecodedFood.foodNutrients.first(where: { $0.nutrient.unitName == "kcal" }))!.amount),
                                portionName: nil,
                                portionWeight: nil,
                                usdaId: filteredDecodedFood.fdcID,
                                udsaSource: "Survey"))
                        }
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
                self.day = Day(date: date)
                context.insert(self.day!)
                try context.save()
            }
            initFoodForDay()
        } catch {
            fatalError("Error retrieving new date: \(error)")
        }
    }

    private func initFoodForDay() {
        do {
            let dayId = day!.id
            self.foodItems = try context.fetch(FetchDescriptor<FoodItem>(
                predicate: #Predicate {
                    $0.dayId == dayId
                }
            ))
        } catch {
            fatalError("Error retrieving food data for day: \(error)")
        }
    }
}

