//
//  EditableFoodItem.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/22/25.
//
import FoundationModels

@Generable
struct EditableFoodItem {
    @Guide(description: "A single number, best estimage of the amount of calories in this food item")
    var calorieCost: Int
    @Guide(description: "A well formatted name for this food item")
    var name: String
    @Guide(description: "A description of this food item")
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
