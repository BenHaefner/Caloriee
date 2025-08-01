//
//  FoodIteration.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/31/25.
//

import SwiftUI

struct FoodIterationView: View {
    @Bindable var day: Day
    @Binding var foodItems: [FoodItem]
    var onFoodItemDelete: (FoodItem) -> Void

    var body: some View {
        ForEach(MealTypes.allCases) { mealType in
            if foodItems.contains(where: { $0.mealType == mealType }) {
                Section(
                    content: {
                        ForEach(foodItems.filter{ $0.mealType == mealType}) { foodItem in
                            NavigationLink(
                                value: FoodDetailNavigation(foodItem: foodItem, creating: false, day: day)
                            ) {
                                FoodView(foodItem: foodItem)
                            }
                            .swipeActions {
                                Button(role: .destructive) {
                                    onFoodItemDelete(foodItem)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                    },
                    header: {
                        Text(mealType.name)
                            .font(.callout)
                            .foregroundColor(.secondary)
                            .fontWeight(.bold)
                    })
            }
        }
    }
}
