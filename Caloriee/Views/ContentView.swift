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
            let existingFoods = try context.fetch(foundations)
            let isDatabaseEmpty = existingFoods.isEmpty
            if isDatabaseEmpty {
                if let url = Bundle.main.url(forResource: "FoundationFoods", withExtension: "json"),
                   let data = try? Data(contentsOf: url) {
                    let decoder = JSONDecoder()
                    let foods = try decoder.decode([CodableFoundationFood].self, from: data)
                    for food in foods {
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
        ContentView().modelContainer(for: [Day.self, Profile.self], inMemory: true)
    }
}
