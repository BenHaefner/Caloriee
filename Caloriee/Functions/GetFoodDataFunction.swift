//
//  GetFoodDataFunction.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/27/25.
//
import SwiftData
import Foundation

public func getFoodData(search: String, context: ModelContext) async throws -> [StoredFood] {
    let searchedFoods = try context.fetch(FetchDescriptor<StoredFood>(predicate: #Predicate {
        $0.name.localizedStandardContains(search)
    }))
    return searchedFoods
}
