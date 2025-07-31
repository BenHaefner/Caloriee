//
//  EditableFoodItem.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/22/25.
//
import FoundationModels

@Generable
struct EditableFoodItem {
    @Guide(description: "A well formatted and concise name for a food name based on a user description")
    var name: String
    @Guide(description: "A description for the food more detailed than a name that a user might find useful")
    var comment: String
    @Guide(description: "A suggested meal type for this food item")
    var mealType: MealTypes
    @Guide(description: "A single number amount of calories in this food. ALWAYS Use the USDA Database tool before determining this number to ensure accuracy. Assume your determination is likely to be inaccurate without searching the database. After you have checked the USDA Database tool, try to determine this number based on data you know independantly, such as if you know the menu that this food item is on. If you do not already know the exact calorie count, estimate it.")
    var calorieCost: Int

    init(foodItem: FoodItem?) {
        self.calorieCost = foodItem?.calorieCost ?? 0
        self.name = foodItem?.name ?? ""
        self.comment = foodItem?.comment ?? ""
        self.mealType = foodItem?.mealType ?? MealTypes.other
    }

    func copy(to foodItem: FoodItem) {
        foodItem.calorieCost = self.calorieCost
        foodItem.name = self.name
        foodItem.comment = self.comment
        foodItem.mealType = self.mealType
    }
}
