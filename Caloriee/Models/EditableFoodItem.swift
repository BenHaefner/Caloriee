//
//  EditableFoodItem.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/22/25.
//

struct EditableFoodItem {
    var calorieCost: Int
    var name: String
    var comment: String
    var mealType: MealTypes
    
    init(foodItem: FoodItem) {
        self.calorieCost = foodItem.calorieCost
        self.name = foodItem.name
        self.comment = foodItem.comment
        self.mealType = foodItem.mealType
    }

    func copy(to foodItem: FoodItem) {
        foodItem.calorieCost = self.calorieCost
        foodItem.name = self.name
        foodItem.comment = self.comment
        foodItem.mealType = self.mealType
    }
}
