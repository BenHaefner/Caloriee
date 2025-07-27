//
//  IntelligentUSDASearch.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/27/25.
//

import FoundationModels
import SwiftUI
import SwiftData

@MainActor
struct IntelligentSearchTool: Tool {
    private var context: ModelContext
    let name = "searchUSDADatabases"
    let description = "Searches a local database for food that matches user searches."

    init(context: ModelContext)
    {
        self.context = context
    }
    
    @Generable()
    struct Arguments {
        @Guide(description: "A single word distillation of the user prompt to be used to search against the USDA database.")
        var searchTerm: String
    }
    
    func call(arguments: Arguments) async throws -> ToolOutput {
        let Foods = try await getFoundationFoodData(search: arguments.searchTerm, context: context)
        let returnableOptions = """
                Here is an array of food from the USDA to help inform your estimation that
                may match the intended food item information \(Foods.joined(separator: ","))
            """
        print(returnableOptions)
        return ToolOutput(returnableOptions)
    }
}

func getFoundationFoodData(search: String, context: ModelContext) async throws -> [String] {
    let FoundationFoods = try context.fetch(FetchDescriptor<FoundationFood>(predicate: #Predicate { $0.foundationFoodDescription.localizedStandardContains(search) && $0.foodNutrients.contains(where: {
        $0.nutrient.unitName == "kcal"
    })})).map( { "USDA Foundation Item: \($0.foundationFoodDescription) \(String(describing: $0.foodNutrients.first(where: { $0.nutrient.unitName == "kcal"})!.amount!.description)) kcal" })
    let SurveyFoods = try context.fetch(FetchDescriptor<SurveyFood>(predicate: #Predicate { $0.surveyFoodDescription.localizedStandardContains(search) && $0.foodNutrients.contains(where: {
        $0.nutrient.unitName == "kcal"
    })})).map( { "USDA Survey Item: \($0.surveyFoodDescription) \(String(describing: $0.foodNutrients.first(where: { $0.nutrient.unitName == "kcal"})!.amount.description)) kcal" })
    return FoundationFoods + SurveyFoods
}
