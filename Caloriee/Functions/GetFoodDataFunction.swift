//
//  GetFoodDataFunction.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/27/25.
//
import Foundation
import SwiftData

public func getFoodData(search: String, context: ModelContext) async throws -> [StoredFood] {
    var descriptor = FetchDescriptor<StoredFood>(
        predicate: #Predicate{
            $0.name.localizedStandardContains(search)
        })
    descriptor.fetchLimit = 10
    let searchedFoods = try context.fetch(descriptor)
    return searchedFoods
}
