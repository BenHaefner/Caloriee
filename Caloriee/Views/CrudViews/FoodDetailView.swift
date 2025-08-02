//
//  FoodEditor.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/9/25.
//

import FoundationModels
import SwiftUI

struct FoodDetailView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    @State var foodItem: FoodItem
    @State var editing: Bool
    @State var editableFoodItem: EditableFoodItem
    @Bindable var day: Day
    let creating: Bool
    var predismiss: () -> Void

    init(foodItem: FoodItem, creating: Bool, day: Day, predismiss: @escaping () -> Void) {
        editableFoodItem = EditableFoodItem(foodItem: foodItem)
        // Need to redo navigation so we can fix that error
        self.foodItem = foodItem
        self.creating = creating
        self.editing = creating
        self.day = day
        self.predismiss = predismiss
    }
    
    var body: some View {
        List {
            EditableRowView(editing: editing, label: "Name", viewModeValue: foodItem.name) {
                TextField("Name", text: $editableFoodItem.name)
            }
            EditableRowView(
                editing: editing, label: "Calories", viewModeValue: foodItem.calorieCost.description
            ) {
                TextField(
                    "Calorie Count", value: $editableFoodItem.calorieCost, formatter: NumberFormatter()
                )
                .keyboardType(.numberPad)  // TODO: Should i add a text mask?
            }
            if editing {
                Picker("Meal", selection: $editableFoodItem.mealType) {
                    ForEach(MealTypes.allCases) { mealType in
                        Text(mealType.name).tag(mealType)
                    }
                }
                .pickerStyle(.inline)
                .font(.headline)
            } else {
                VStack(alignment: .leading) {
                    Text("Meal")
                        .font(.headline)
                    Text(foodItem.mealType.name)
                }
            }
            
            VStack(alignment: .leading) {
                Text("Description")
                    .font(.headline)
                Spacer()
                if editing {
                    TextField("Description", text: $editableFoodItem.comment, axis: .vertical)
                } else {
                    Text(foodItem.comment)
                    
                }
            }
        }
        .toolbar(content: {
            ToolbarItemGroup(placement: .primaryAction) {
                FoodDetailToolbarContentView(
                    foodItem: $foodItem,
                    editableFoodItem: $editableFoodItem,
                    editing: $editing,
                    creating: creating,
                    predismiss: predismiss
                )
            }
        })
    }
}

