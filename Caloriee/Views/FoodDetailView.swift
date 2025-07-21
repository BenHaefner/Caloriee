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
            EditableRow(editing: editing, label: "Name", viewModeValue: foodItem.name) {
                TextField("Name", text: $editableFoodItem.name)
                    .multilineTextAlignment(.trailing)
            }
            EditableRow(editing: editing, label: "Calories", viewModeValue: foodItem.calorieCost.description) {
                TextField("Calorie Count", value: $editableFoodItem.calorieCost, formatter: NumberFormatter())
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.numberPad) // TODO: Should i add a text mask?
            }
            if (editing) {
                Picker("Meal", selection: $editableFoodItem.mealType) {
                    ForEach(MealTypes.allCases) { mealType in
                        Text(mealType.name).tag(mealType)
                    }
                }
                    .font(.headline)
            } else {
                HStack {
                    Text("Meal")
                        .font(.headline)
                    Spacer()
                    Text(foodItem.mealType.name)
                }
            }
            VStack(alignment: .leading) {
                Text("Description")
                    .font(.headline)
                Spacer()
                if (editing) {
                    TextField("Description", text: $editableFoodItem.description, axis: .vertical)
                } else {
                    Text(foodItem.description)

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
                    Image(systemName: editing ? "checkmark" : "square.and.pencil")
                }
            }
        }
    }
    
    struct EditableRow<Content: View>: View {
        var editing: Bool
        let label: String
        let viewModeValue: String
        let editableContent: () -> Content

        var body: some View {
            HStack {
                Text(label)
                    .font(.headline)
                Spacer()
                if (!editing) {
                    Text(viewModeValue)
                } else {
                    editableContent()
                }
            }
        }
    }
}
