//
//  FoodEditor.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/9/25.
//

import SwiftUI

struct FoodDetailView: View {
    @Binding var foodItem: FoodItem
    @State var editing: Bool = false
    @State var editableFoodItem: FoodItem

    init(foodItem: Binding<FoodItem>) {
        editableFoodItem = foodItem.wrappedValue
        self._foodItem = foodItem
    }
    
    var body: some View {
        List {
            if editing {
                TextField("Name", text: $editableFoodItem.name)
                TextField("Calorie Count", value: $editableFoodItem.calorieCost, formatter: NumberFormatter())
                    .keyboardType(.numberPad) // TODO: Should i adda a text mask?
                Picker("Meal", selection: $editableFoodItem.mealType) {
                    ForEach(MealTypes.allCases) { mealType in
                        Text(mealType.name).tag(mealType)
                    }
                }
                TextField("Description", text: $editableFoodItem.description, axis: .vertical)
            } else {
                HStack {
                    Text("Name")
                        .font(.headline)
                    Spacer()
                    Text(foodItem.name)
                }
                HStack {
                    Text("Calories")
                        .font(.headline)
                    Spacer()
                    Text(foodItem.calorieCost.description)
                        .font(.title3)
                }
                HStack {
                    Text("Meal")
                        .font(.headline)
                    Spacer()
                    Text(foodItem.mealType.name)
                        .font(.title3)
                }
                VStack(alignment: .leading) {
                    Text("Description")
                        .font(.headline)
                    Spacer()
                    Text(foodItem.description)
                        .font(.title3)
                }
            }
        }
        .toolbar{
            ToolbarItem {
                Button {
                    if (editing) {
                        foodItem = editableFoodItem
                    }
                    editing.toggle()
                } label: {
                    Text(editing ? "Done" : "Edit")
                }
            }
        }
    }
}
