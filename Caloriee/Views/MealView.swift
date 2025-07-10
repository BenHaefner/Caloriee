//
//  FoodListView.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/9/25.
//

import SwiftUI

struct MealView: View {
    let meal: Meal = Meal(name: "Snack", foodItems: [
        FoodItem(calorieCost: 240, name: "Hot Chocolate", description: "A refreshing cup!"),
        FoodItem(calorieCost: 500, name: "Bee Bites", description: "I dont know but I like it...")
    ])
    var body: some View {
        List {
            // TODO: Implement multiple meal types, iterate
            Section(content: {
                ForEach(meal.foodItems) { foodItem in
                    NavigationLink {
                        FoodEditor()
                    } label: {
                        FoodView(foodItem: foodItem)
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            meal.deleteFoodItem(foodItem)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            },
            header: {
                Text(meal.name)
                    .font(.callout)
                    .foregroundColor(.secondary)
                    .fontWeight(.bold)
            })
        }
    }
}

#Preview {
    MealView()
}
