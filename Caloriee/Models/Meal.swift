//
//  Meal.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/9/25.
//
import SwiftUI

struct Meal: Identifiable {
    var id = UUID()
    var name: String
    @State var foodItems: [FoodItem]
    
    var calorieTotal: Int {
        // To get the current calorie total for a meal,
        // add the calorie costs of each food item.
        // $0 is the current accumulated cost, $1 is the
        // next food item in the array
        foodItems.reduce(0) { $0 + $1.calorieCost }
    }
    
    func deleteFoodItem(_ deletedItem: FoodItem) {
        foodItems.removeAll(where: {$0.id == deletedItem.id})
    }

}
