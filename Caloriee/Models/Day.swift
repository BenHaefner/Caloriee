//
//  Day.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/9/25.
//
import SwiftUI

struct Day: Identifiable {
    var id = UUID()
    var date: Date
    var foodItems: [FoodItem]
    
    var caloriesConsumed: Int {
        self.foodItems.reduce(0) {$0 + $1.calorieCost}
    }
    
    mutating func deleteFoodItem(_ deletedItem: FoodItem) {
        foodItems.removeAll(where: {$0.id == deletedItem.id})
    }
}

