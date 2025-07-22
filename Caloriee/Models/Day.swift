//
//  Day.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/9/25.
//
import SwiftUI
import SwiftData

@Model()
final class Day: Identifiable {
    var id = UUID()
    var date: Date
    var foodItems: [FoodItem]
    
    var caloriesConsumed: Int {
        self.foodItems.reduce(0) {$0 + $1.calorieCost}
    }
    
    init(date: Date, foodItems: [FoodItem] = []) {
        self.date = date
        self.foodItems = foodItems
    }
    
    func deleteFoodItem(_ deletedItem: FoodItem) {
        foodItems.removeAll(where: {$0.id == deletedItem.id})
    }
}

