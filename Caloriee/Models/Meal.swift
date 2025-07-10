//
//  Meal.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/9/25.
//
import SwiftUI

struct Meal: Identifiable, Hashable {
    var id = UUID()
    var calorieTotal: Int
    var name: String
    var foodItems: [Food]
    
}
