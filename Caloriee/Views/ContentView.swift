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
    
    var body: some View {
        if (user != nil || day != nil) {
            DayView(user: user!, day: day!, onChangeDate: { date in
                Task {
                    await reinitDate(for: date)
                }
            })
        } else {
            ProgressView()
                .task {
                    await initializeData()
                }
        }
    }
    
    private func initializeData() async {
        do {
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
            
            let today = Calendar.current.startOfDay(for: Date())
            let days = try context.fetch(FetchDescriptor<Day>(
                predicate: #Predicate {$0.date == today}
            ))
            let day = days.first
            if (day != nil) {
                self.day = day!
            } else {
                // TODO: Have the user set a goal when they first access the app
                self.day = Day(date: today, foodItems: [])
                context.insert(self.day!)
                try context.save()
            }
        } catch {
            fatalError("Error retrieving initial data: \(error)")
        }
    }
    
    private func reinitDate(for date: Date) async {
        do {
            let days = try context.fetch(FetchDescriptor<Day>(
                predicate: #Predicate {$0.date == date}
            ))
            let day = days.first
            if (day != nil) {
                self.day = day!
            } else {
                // TODO: Have the user set a goal when they first access the app
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
