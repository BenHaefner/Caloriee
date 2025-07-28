//
//  CalorieeApp.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/8/25.
//

import SwiftUI
import SwiftData

@main
struct CalorieeApp: App {
    let sharedCalorieeContainer = Self.calorieeContainer()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }.modelContainer(sharedCalorieeContainer)
    }
    
    static private func calorieeContainer() -> ModelContainer {
        do {
            return try ModelContainer(for: Day.self, Profile.self, StoredFood.self)
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
}
