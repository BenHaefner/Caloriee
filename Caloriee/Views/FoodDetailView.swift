//
//  FoodEditor.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/9/25.
//

import SwiftUI
import FoundationModels

struct FoodDetailView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    @Binding var foodItem: FoodItem
    @State var editing: Bool
    @State var editableFoodItem: EditableFoodItem
    @State var generating: Bool = false
    @Bindable var day: Day
    var creating: Bool
    private var model = SystemLanguageModel.default

    init(foodItem: Binding<FoodItem>, creating: Bool, day: Day) {
        editableFoodItem = EditableFoodItem(foodItem: foodItem.wrappedValue)
        self._foodItem = foodItem
        self.creating = creating
        self.editing = creating
        self.day = day
    }
    
    var body: some View {
        List {
            EditableRow(editing: editing, label: "Name", viewModeValue: foodItem.name) {
                TextField("Name", text: $editableFoodItem.name)
            }
            EditableRow(editing: editing, label: "Calories", viewModeValue: foodItem.calorieCost.description) {
                TextField("Calorie Count", value: $editableFoodItem.calorieCost, formatter: NumberFormatter())
                    .keyboardType(.numberPad) // TODO: Should i add a text mask?
            }
            if (editing) {
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
                if (editing) {
                    TextField("Description", text: $editableFoodItem.comment, axis: .vertical)
                } else {
                    Text(foodItem.comment)

                }
            }
        }
        .toolbar{
            ToolbarItemGroup(placement: .primaryAction) {
                if(editing && model.availability == .available) {
                    Button {
                        // TODO: Generate suggested calories
                        generating = true
                    } label: {
                        Image(systemName: "apple.intelligence")
                    }
                    .popover(isPresented: $generating) {
                        GeneratePopoverView(onGenerated: { generatedFoodItem in
                            Task {
                                [
                                    editableFoodItem = generatedFoodItem
                                ]
                            }
                        })
                    }
                }
                Button {
                    if (editing) {
                        editableFoodItem.copy(to: foodItem)
                        if (creating) {
                            day.addFoodItem(foodItem)
                        }
                        dismiss()
                    }
                    if (!creating) {
                        editing.toggle()
                    }
                } label: {
                    Image(systemName: editing ? "checkmark" : "square.and.pencil")
                }
                .buttonStyle(.glassProminent)
            }
            ToolbarItem(placement: .cancellationAction) {
                if (creating) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "multiply")
                    }
                }
            }
            ToolbarItem(placement:.title) {
                if (creating) {
                    Text("Add")
                        .font(.title2)
                } else if (editing) {
                    Text("Edit")
                        .font(.title2)
                } else {
                    Text("Detail")
                        .font(.title2)
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
            VStack (alignment: .leading) {
                Text(label)
                    .font(.headline)
                if (!editing) {
                    Text(viewModeValue)
                } else {
                    editableContent()
                }
            }
        }
    }
}
