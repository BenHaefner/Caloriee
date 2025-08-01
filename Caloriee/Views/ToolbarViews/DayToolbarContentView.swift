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
            Image(systemName: "chevron.backward")
        }
        Button {
            let newDate = Calendar.current.date(byAdding: .day, value: 1, to: day.date)
            onChangeDate(newDate!)
        } label: {
            Image(systemName: "chevron.forward")
        }
        Button {
            newFoodItem = FoodItem(dayId: day.id)
            stackPath.append(FoodDetailNavigation(foodItem: newFoodItem!, creating: true, day: day))
        } label: {
            Image(systemName: "plus.square")
        }

        Button {
            selectingDate = true
        } label: {
            Image(systemName: "calendar")
        }
        .popover(isPresented: $selectingDate) {
            VStack {
                HStack {
                    Button {
                        selectingDate = false
                    } label: {
                        Image(systemName: "multiply")
                    }
                    .buttonStyle(.bordered)
                    Spacer()
                    Button {
                        selectingDate = false
                        onChangeDate(newAnyDate)
                    } label: {
                        Image(systemName: "checkmark")
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
            Image(systemName: "sparkle.text.clipboard")
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
