//
//  FoodListView.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/9/25.
//

import SwiftData
import SwiftUI

struct DayView: View {
    @Environment(\.modelContext) private var context
    @Bindable var user: Profile
    @Bindable var day: Day
    @Binding var foodItems: [FoodItem]
    @Binding var stackPath: [FoodDetailNavigation]
    @State private var addingFood = false
    var onChangeDate: (Date) -> Void
    var getFoodItemDataForDay: () async -> Void

    var body: some View {
        List {
            Section(
                content: {
                    VStack(alignment: .leading) {
                        ProgressArcView(caloriesConsumed: getCaloriesConsumed(foodItems: self.foodItems), calorieGoal: user.calorieGoal)
                            .frame(maxWidth: .infinity)
                    }
                },
                header: {
                    Text(day.date.formatted(date: .abbreviated, time: .omitted))
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                })
            FoodIterationView(day: day, foodItems: $foodItems, onFoodItemDelete: { deletedFood in
                Task {
                    await removeFoodItem(deletableFood: deletedFood)
                    await getFoodItemDataForDay()
                }
            })
        }
        .toolbar {
            ToolbarItemGroup(
                placement: .bottomBar,
                content: {
                    DayToolbarContentView(
                        user: user,
                        day: day,
                        stackPath: $stackPath,
                        onChangeDate: { changedDate in
                            onChangeDate(changedDate)
                        })
                })
        }
    }

    func removeFoodItem(deletableFood: FoodItem) async {
        do {
            context.delete(deletableFood)
            try context.save()
        } catch {
            fatalError("Error retrieving food data for day: \(error)")
        }
    }
}
