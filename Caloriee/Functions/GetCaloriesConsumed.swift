//
//  GetCaloriesConsumed.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/31/25.
//

func getCaloriesConsumed(foodItems: [FoodItem]) -> Int {
    return foodItems.reduce(0) {$0 + $1.calorieCost}
}
