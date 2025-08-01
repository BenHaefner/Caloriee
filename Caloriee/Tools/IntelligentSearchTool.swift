//
//  IntelligentUSDASearch.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/27/25.
//

import FoundationModels
import SwiftData
import SwiftUI

@MainActor
struct IntelligentSearchTool: Tool {
    private var context: ModelContext
    let name = "searchUSDADatabases"
    let description = "Searches a local database for food that matches user searches."

    init(context: ModelContext) {
        self.context = context
    }

    @Generable()
    struct Arguments {
        @Guide(
            description:
                "A single word distillation of the user prompt to be used to search against the USDA database."
        )
        var searchTerm: String
    }

    func call(arguments: Arguments) async throws -> String {
        let Foods = try await getFoodData(search: arguments.searchTerm, context: context)
        let mappedFoods = Foods.map { "\($0.name) - \($0.calories) cal" }.joined(separator: "\n")
        let returnableOptions = """
          Here is an array of food from the USDA to help inform your estimation that
          may match the intended food item information \(mappedFoods)
      """
        print(returnableOptions)
        return returnableOptions
    }
}
