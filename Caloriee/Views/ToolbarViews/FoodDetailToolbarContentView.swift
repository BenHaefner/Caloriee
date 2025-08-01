//
//  FoodDetailToolbarView.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/31/25.
//

import SwiftUI
import FoundationModels

struct FoodDetailToolbarContentView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    @Binding var foodItem: FoodItem
    @Binding var editableFoodItem: EditableFoodItem
    @Binding var editing: Bool
    @State var generating: Bool = false
    @State var selecting: Bool = false
    var creating: Bool
    var model = SystemLanguageModel.default
    var predismiss: () -> Void

    var body: some View {
        if editing && model.availability == .available {
            Button {
                if !selecting { generating = true }
            } label: {
                Image(systemName: "sparkles")
            }
            .popover(isPresented: $generating) {
                GeneratePopoverView(onGenerated: { generatedFoodItem in
                    editableFoodItem = generatedFoodItem
                })
            }
        }

        if editing {
            Button {
                if !generating { selecting = true }
            } label: {
                Image(systemName: "list.bullet")
            }
            .popover(isPresented: $selecting) {
                SelectableFoodView(onSelected: { selectedStoredFood in
                    Task {
                        editableFoodItem.name = selectedStoredFood.name
                        editableFoodItem.calorieCost = selectedStoredFood.calories
                    }
                })
            }
        }

        Button {
            if editing {
                editableFoodItem.copy(to: foodItem)
                if creating {
                    context.insert(foodItem)
                }
                Task {
                    try context.save()
                    predismiss()
                    dismiss()
                }
            }
            if !creating {
                editing.toggle()
            }
        } label: {
            Image(systemName: editing ? "checkmark" : "square.and.pencil")
        }
        .buttonStyle(.glassProminent)
    }
}

