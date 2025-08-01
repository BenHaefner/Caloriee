//
//  Food.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/9/25.
//
import SwiftUI
import SwiftData

@Model()
final class FoodItem: Identifiable {
    var id = UUID()
    var calorieCost: Int
    var name: String
    var comment: String
    var dayId: UUID
    var mealType: MealTypes

    init(calorieCost: Int = 0, name: String = "", comment: String = "", dayId: UUID, mealType: MealTypes = MealTypes.other) {
        self.calorieCost = calorieCost
        self.name = name
        self.comment = comment
        self.dayId = dayId
        self.mealType = mealType
    }
}
