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
            NavigationView {
                DayView(
                    user: Profile(calorieGoal: 2200),
                    day: Day(
                        date: Date.now,
                        foodItems: [
                            FoodItem(calorieCost: 240, name: "Hot Chocolate", description: "A refreshing cup!", mealType: MealTypes.breakfast),
                            FoodItem(calorieCost: 500, name: "Bee Bites", description: "I dont know but I like it...", mealType: MealTypes.dinner),
                            FoodItem(calorieCost: 200, name: "Rice", description: "Simple and clean is the way that you're making me feel tonight. It's hard to let it go. When you walk away, you dont hear me say \"please baby dont go.\"", mealType: MealTypes.snacks)
                        ]
                    )
                )
            }
        }
    }
}
