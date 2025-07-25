//
//  GeneratePopoverView.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/24/25.
//

import SwiftUI
import FoundationModels

// TODO: Move into popover in FoodDetailView
struct GeneratePopoverView: View {
    @Environment(\.dismiss) var dismiss
    @State var generatedFoodItemDescription: String = ""
    @State var generatingFood: Bool = false
    var onGenerated: (EditableFoodItem) -> Void

    var body: some View {
        VStack (alignment: .leading){
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "multiply")
                }
                    .buttonStyle(.bordered)
                Spacer()
            }
            Text("Please describe the food you want Apple Intelligence to estimate for you")
                .font(.headline)
            ZStack {
                TextEditor(text: $generatedFoodItemDescription)
                    .padding()
             }
                 .scrollContentBackground(.hidden)
                 .background(Color.gray.opacity(0.1))
                 .cornerRadius(20)
        }
            .padding()
            .presentationDetents([.medium])
        Button {
            generatingFood = true

            let instructions = """
                Estimate the calories found in the user provided description for a food item.
                """
            let session = LanguageModelSession(instructions: instructions)
            let prompt = "Making homemade bread"
            let response = try await session.respond(to: generatedFoodItemDescription, generating: EditableFoodItem
        } label: {
            HStack {
                Image(systemName: "apple.intelligence")
                Text("Generate")
            }
        }
            .buttonStyle(.glassProminent)

    }
}
