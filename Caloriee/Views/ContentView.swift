//
//  ContentView.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/8/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @State var user: Profile?
    @State var day: Day?
    @State var initializeTask: String = ""
    
    var body: some View {
        if (user != nil || day != nil) {
            DayView(user: user!, day: day!, onChangeDate: { date in
                Task {
                    await reinitDate(for: date)
                }
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
    
    private func initializeData() async {
        do {
            initializeTask = "Initializing profile..."
            let profiles = try context.fetch(FetchDescriptor<Profile>())
            let profile = profiles.first
            if (profile != nil) {
                self.user = profile!
            } else {
                // TODO: Have the user set a goal when they first access the app
                self.user = Profile(calorieGoal: 2200)
                context.insert(self.user!)
                try context.save()
            }

            initializeTask = "Initializing day..."
            let today = Calendar.current.startOfDay(for: Date())
            let days = try context.fetch(FetchDescriptor<Day>(
                predicate: #Predicate {$0.date == today}
            ))
            let day = days.first
            if (day != nil) {
                self.day = day!
            } else {
                self.day = Day(date: today, foodItems: [])
                context.insert(self.day!)
                try context.save()
            }

            initializeTask = "Initializing food database..."
            var foundations = FetchDescriptor<FoundationFood>()
            foundations.fetchLimit = 1
            let existingFoundationFoods = try context.fetch(foundations)
            if existingFoundationFoods.isEmpty {
                if let url = Bundle.main.url(forResource: "USDA_FF_2025-04-24", withExtension: "json"),
                   let data = try? Data(contentsOf: url) {
                    let decoder = JSONDecoder()
                    let decodedFoods = try decoder.decode(CodableUsda.self, from: data)
                    let persistableFoods = decodedFoods.foundationFoods!.map { FoundationFood(from: $0) }
                    for food in persistableFoods {
                        context.insert(food)
                    }
                    try context.save()
                }
            }
            var surveys = FetchDescriptor<SurveyFood>()
            surveys.fetchLimit = 1
            let existingSurveyFoods = try context.fetch(surveys)
            if existingSurveyFoods.isEmpty {
                if let url = Bundle.main.url(forResource: "USDA_FNDDS_2024_10", withExtension: "json"),
                   let data = try? Data(contentsOf: url) {
                    let decoder = JSONDecoder()
                    let decodedFoods = try decoder.decode(CodableUsda.self, from: data)
                    let persistableFoods = decodedFoods.surveyFoods!.map { SurveyFood(from: $0) }
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
            let days = try context.fetch(FetchDescriptor<Day>(
                predicate: #Predicate {$0.date == newDate}
            ))
            let day = days.first
            if (day != nil) {
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

#Preview {
    NavigationView {
        ContentView().modelContainer(for: [Day.self, Profile.self, FoundationFood.self, SurveyFood.self], inMemory: true)
    }
}
