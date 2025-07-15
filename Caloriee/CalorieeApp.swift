//
//  CalorieeApp.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/8/25.
//

import SwiftUI

@main
struct CalorieeApp: App {
    var body: some Scene {
        WindowGroup {
            DayView(foodItems: [
                FoodItem(calorieCost: 240, name: "Hot Chocolate", description: "A refreshing cup!", mealType: MealTypes.breakfast),
                FoodItem(calorieCost: 500, name: "Bee Bites", description: "I dont know but I like it...", mealType: MealTypes.dinner),
                FoodItem(calorieCost: 200, name: "Rice", description: "Simple and clean", mealType: MealTypes.snacks)
            ])
        }
    }
}
