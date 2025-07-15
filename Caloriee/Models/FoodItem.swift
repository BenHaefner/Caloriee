//
//  Food.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/9/25.
//
import SwiftUI

struct FoodItem: Identifiable {
    var id = UUID()
    var calorieCost: Int = 0
    var name: String = ""
    var description: String = ""
    var mealType: MealTypes = .other // TODO: Make no longer "other" in the future when im more certain of the data model

}
