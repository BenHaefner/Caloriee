//
//  FoodListView.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/9/25.
//

import SwiftUI

struct DayView: View {
    // TODO: Move to real data
    @State var user: Profile
    @State var day: Day
    @State private var addingFood = false
    @State private var newFoodItem = FoodItem()

    var body: some View {
        List{
            Section(content: {
                VStack(alignment: .leading) {
                    ProgressArcView(caloriesConsumed: day.caloriesConsumed, calorieGoal: user.calorieGoal)
                        .frame(maxWidth:.infinity)
                }
            }, header: {
                Text(day.date.formatted(date: .complete, time: .omitted))
                    .font(.title)
                    .foregroundColor(.primary)
                    .fontWeight(.bold)
            })
            ForEach(MealTypes.allCases) { mealType in
                if day.foodItems.contains(where: { $0.mealType == mealType }) {
                    Section(content: {
                        ForEach($day.foodItems.filter{ $0.mealType.wrappedValue == mealType }) { $foodItem in
                            NavigationLink {
                                FoodDetailView(foodItem: $foodItem)
                            } label: {
                                FoodView(foodItem: foodItem)
                            }
                            .swipeActions {
                                Button(role: .destructive) {
                                    day.deleteFoodItem(foodItem)
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
}

#Preview {
    NavigationView {
        DayView(
            user: Profile(calorieGoal: 2200),
            day: Day(
                date: Date.now,
                foodItems: [
                    FoodItem(calorieCost: 240, name: "Hot Chocolate", description: "A refreshing cup!", mealType: MealTypes.breakfast),
                    FoodItem(calorieCost: 500, name: "Bee Bites", description: "I dont know but I like it...", mealType: MealTypes.dinner),
                    FoodItem(calorieCost: 200, name: "Rice", description: "Simple and clean is the way that you're making me feel tonight. It's hard to let it go. When you walk away, you dont hear me say \"please baby dont go.\"", mealType: MealTypes.snacks)
                ]
            )
        )
    }
}
