//
//  CalorieeToolbarView.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/31/25.
//

import SwiftUI

struct DayToolbarContentView: View {
    @Bindable var user: Profile
    @Bindable var day: Day
    @Binding var stackPath: [FoodDetailNavigation]
    @State private var newFoodItem: FoodItem?
    @State private var selectingDate = false
    @State private var newAnyDate = Date()
    @State private var editingGoal = false

    var onChangeDate: (Date) -> Void

    var body: some View {
        Button {
            let newDate = Calendar.current.date(byAdding: .day, value: -1, to: day.date)
            onChangeDate(newDate!)
        } label: {
            Label("Previous Date", systemImage: "chevron.backward")
                .labelStyle(.iconOnly)
        }
        Button {
            let newDate = Calendar.current.date(byAdding: .day, value: 1, to: day.date)
            onChangeDate(newDate!)
        } label: {
            Label("Next Date", systemImage: "chevron.forward")
                .labelStyle(.iconOnly)
        }
        Button {
            newFoodItem = FoodItem(dayId: day.id)
            stackPath.append(FoodDetailNavigation(foodItem: newFoodItem!, creating: true, day: day))
        } label: {
            Label("Add Food", systemImage: "plus.square")
                .labelStyle(.iconOnly)
        }

        Button {
            selectingDate = true
        } label: {
            Label("Select Date By Calendar", systemImage: "calendar")
                .labelStyle(.iconOnly)
        }
        .popover(isPresented: $selectingDate) {
            VStack {
                HStack {
                    Button {
                        selectingDate = false
                    } label: {
                        Label("Close", systemImage: "multiply")
                            .labelStyle(.iconOnly)
                    }
                    .buttonStyle(.bordered)
                    Spacer()
                    Button {
                        selectingDate = false
                        onChangeDate(newAnyDate)
                    } label: {
                        Label("Done", systemImage: "checkmark")
                            .labelStyle(.iconOnly)
                    }
                    .buttonStyle(.glassProminent)
                }
                DatePicker("Selected Date", selection: $newAnyDate, displayedComponents: [.date])
                    .datePickerStyle(.graphical)
            }
            .padding()
            .presentationDetents([.medium])
        }
        Button {
            editingGoal = true
        } label: {
            Label("Set Goal", systemImage: "sparkle.text.clipboard")
                .labelStyle(.iconOnly)
        }
        .sheet(isPresented: $editingGoal) {
            GoalSettingView(
                isEdit: true,
                onSet: { newGoal in
                    user.calorieGoal = newGoal
                    editingGoal = false
                })
        }
    }
}
