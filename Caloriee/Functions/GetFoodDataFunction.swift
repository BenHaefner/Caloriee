//
//  GetFoodDataFunction.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/27/25.
//
import SwiftData
import Foundation

public func getFoodData(search: String, context: ModelContext) async throws -> [String] {
    let FoundationFoods = try context.fetch(FetchDescriptor<FoundationFood>(predicate: #Predicate { $0.foundationFoodDescription.localizedStandardContains(search) && $0.foodNutrients.contains(where: {
        $0.nutrient.unitName == "kcal"
    })})).map( { "\($0.foundationFoodDescription) \(String(describing: $0.foodNutrients.first(where: { $0.nutrient.unitName == "kcal"})!.amount!.description)) kcal" })
    let SurveyFoods = try context.fetch(FetchDescriptor<SurveyFood>(predicate: #Predicate { $0.surveyFoodDescription.localizedStandardContains(search) && $0.foodNutrients.contains(where: {
        $0.nutrient.unitName == "kcal"
    })})).map( { "\($0.surveyFoodDescription) \(String(describing: $0.foodNutrients.first(where: { $0.nutrient.unitName == "kcal"})!.amount.description)) kcal" })
    return FoundationFoods + SurveyFoods
}
