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
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    @State var generatedFoodItemDescription: String = ""
    @State var generatingFood: Bool = false
    @State var failedGeneration: Bool = false
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
                if (failedGeneration) {
                    Spacer()
                    Text("There was an error while generating your food item. Please try again later.")
                        .font(.headline)
                    Spacer()

                } else {
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
                            Image(systemName: "sparkles")
                            Text("Generate")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                    }
                    .buttonStyle(.glassProminent)

                }
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
        for i in 0..<3 {
            do {
                let instructions = """
                    ALWAYS Use the searchUSDADatabases tool EVERY TIME to help you determine 
                    the calories in a user provided food item. You will be inaccurate
                    without at least first searching the database.
                    """
                let session = LanguageModelSession(tools: [IntelligentSearchTool(context: context)], instructions: instructions)
                let prompt = "\(generatedFoodItemDescription)"
                let response = try await session.respond(to: prompt, generating: EditableFoodItem.self)
                onGenerated(response.content)
                dismiss()
                break
            } catch {
                if (i == 2) {
                    generatingFood = false
                    failedGeneration = true
                }
                print("Error while generating food item : \(error)")
            }
        }
    }
}
