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
            ContentView()
        }.modelContainer(sharedCalorieeContainer) // TODO: Look into where this needs to go
    }
    
    static private func calorieeContainer() -> ModelContainer {
        do {
            return try ModelContainer(for: Day.self, Profile.self, StoredFood.self)
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
}
