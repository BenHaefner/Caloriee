//
//  EditableFoodItem.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/22/25.
//
import FoundationModels

@Generable
struct EditableFoodItem {
    @Guide(description: "A single number, best estimate of the amount of calories in this food")
    var calorieCost: Int
    @Guide(description: "A well formatted and concise name for a food name based on a user description")
    var name: String
    @Guide(description: "A description for the food more detailed than a name that a user might find useful")
    var comment: String
    @Guide(description: "A suggested meal type for this food item")
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
