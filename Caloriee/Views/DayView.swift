//
//  FoodListView.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/9/25.
//

import SwiftUI
import SwiftData

struct DayView: View {
    // TODO: Move to real data
    @Environment(\.modelContext) private var context
    @Bindable var user: Profile
    @Bindable var day: Day
    @State private var addingFood = false
    @State private var newFoodItem = FoodItem()
    @State private var selectingDate = false
    @State private var newAnyDate = Date()
    var onChangeDate: (Date) -> Void

    var body: some View {
        List{
            Section(content: {
                VStack(alignment: .leading) {
                    ProgressArcView(caloriesConsumed: day.caloriesConsumed, calorieGoal: user.calorieGoal)
                        .frame(maxWidth:.infinity)
                }
            }, header: {
                Text(day.date.formatted(date: .abbreviated, time: .omitted))
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            })
            ForEach(MealTypes.allCases) { mealType in
                if day.foodItems.contains(where: { $0.mealType == mealType }) {
                    Section(content: {
                        ForEach($day.foodItems.filter{ $0.mealType.wrappedValue == mealType }) { $foodItem in
                            NavigationLink {
                                FoodDetailView(foodItem: $foodItem, creating: false, day: day)
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
        .toolbar{
            ToolbarItemGroup(placement: .bottomBar, content: {
                Button {
                    let newDate = Calendar.current.date(byAdding: .day, value: -1, to: day.date)
                    onChangeDate(newDate!)
                } label: {
                    Image(systemName: "chevron.backward")
                }
                Button {
                    let newDate = Calendar.current.date(byAdding: .day, value: 1, to: day.date)
                    onChangeDate(newDate!)
                } label: {
                    Image(systemName: "chevron.forward")
                }
                Button() {
                    addingFood = true;
                } label: {
                    Image(systemName: "plus.square")
                }
                    .sheet(isPresented: $addingFood, onDismiss: {
                        newFoodItem = FoodItem();
                    }) {
                        NavigationView {
                            FoodDetailView(foodItem: $newFoodItem, creating: true, day: day)
                        }
                    }
                Button {
                    selectingDate = true
                } label: {
                    Image(systemName: "calendar")
                }
                    .popover(isPresented: $selectingDate) {
                        DatePicker("Selected Date", selection: $newAnyDate, displayedComponents: [.date])
                            .datePickerStyle(.graphical)
                        Button {
                            selectingDate = false
                        } label: {
                            Image(systemName: "checkmark")
                        }
                    }
                Button {
                    print("edit user")
                } label: {
                    Image(systemName: "person")
                }
                
            })
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
                    FoodItem(calorieCost: 240, name: "Hot Chocolate", comment: "A refreshing cup!", mealType: MealTypes.breakfast),
                    FoodItem(calorieCost: 500, name: "Bee Bites", comment: "I dont know but I like it...", mealType: MealTypes.dinner),
                    FoodItem(calorieCost: 200, name: "Rice", comment: "Simple and clean is the way that you're making me feel tonight. It's hard to let it go. When you walk away, you dont hear me say \"please baby dont go.\"", mealType: MealTypes.snacks)
                ]
            ), onChangeDate: { date in
                print(date.description)
            }
        )
    }
}
