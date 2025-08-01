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
        Section(
            content: {
                ForEach(foodItems) { foodItem in
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
                Text("Foods") // TODO: Break out to meals
                    .font(.callout)
                    .foregroundColor(.secondary)
                    .fontWeight(.bold)
            })
    }
}
