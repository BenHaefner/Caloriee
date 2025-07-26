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
            if !(generatingFood) {
                Text("Please describe the food you want Apple Intelligence to estimate for you")
                    .font(.headline)

                ZStack {
                    TextEditor(text: $generatedFoodItemDescription)
                        .padding()
                }
                .scrollContentBackground(.hidden)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)

                Button {
                    generatingFood = true
                    
                } label: {
                    HStack {
                        Image(systemName: "apple.intelligence")
                        Text("Generate")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                }
                .buttonStyle(.glassProminent)
            } else {
                VStack (alignment: .center) {
                    Spacer()
                    Text("Estimating...")
                    ProgressView()
                        .progressViewStyle(.circular)
                        .task {
                            await generateFoodItem()
                        }
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .padding()
        .presentationDetents([.medium])
    }

    private func generateFoodItem() async {
        do {
            let instructions = """
                The intention behind this application is to track calories and provide estimations
                for food items that the user doesnt know or isnt certain about how many calories are in them.
                Estimate the calories found in the user provided description for a food item.
                Only estimate the calories for the exact item that the user specifies, and not any form of meal,
                unless the user lists multiple items or quantities. Be polite.
                """
            let session = LanguageModelSession(instructions: instructions)
            let response = try await session.respond(to: generatedFoodItemDescription, generating: EditableFoodItem.self)
            onGenerated(response.content)
            dismiss()
        } catch {
            fatalError("Error while generating food item : \(error)")
        }
    }
}
