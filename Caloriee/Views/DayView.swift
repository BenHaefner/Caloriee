//
//  FoodListView.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/9/25.
//

import SwiftUI

struct DayView: View {
    // Move to real data
    @State var foodItems: [FoodItem]
    @State private var addingFood = false
    @State private var newFoodItem = FoodItem()

    var body: some View {
        List {
            ForEach(MealTypes.allCases) { mealType in
                if foodItems.contains(where: { $0.mealType == mealType }) {
                    Section(content: {
                        ForEach(foodItems.filter{ $0.mealType == mealType }) { foodItem in
                            NavigationLink {
                                FoodEditView(foodItem: foodItem)
                            } label: {
                                FoodView(foodItem: foodItem)
                            }
                            .swipeActions {
                                Button(role: .destructive) {
                                    deleteFoodItem(foodItem)
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
  
    // TODO: Move to day file once we implement day based meals
    func deleteFoodItem(_ deletedItem: FoodItem) {
        foodItems.removeAll(where: {$0.id == deletedItem.id})
    }
}

#Preview {
    NavigationView {
        DayView(foodItems: [
            FoodItem(calorieCost: 240, name: "Hot Chocolate", description: "A refreshing cup!", mealType: MealTypes.breakfast),
            FoodItem(calorieCost: 500, name: "Bee Bites", description: "I dont know but I like it...", mealType: MealTypes.dinner),
            FoodItem(calorieCost: 200, name: "Rice", description: "Simple and clean", mealType: MealTypes.snacks)
        ])
    }
}
