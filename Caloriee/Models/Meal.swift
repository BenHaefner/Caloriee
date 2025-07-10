//
//  Meal.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/9/25.
//
import SwiftUI

struct Meal: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var foodItems: [FoodItem]
    
    var calorieTotal: Int {
        // To get the current calorie total for a meal,
        // add the calorie costs of each food item.
        // $0 is the current accumulated cost, $1 is the
        // next food item in the array
        foodItems.reduce(0) { $0 + $1.calorieCost }
    }
    
}
