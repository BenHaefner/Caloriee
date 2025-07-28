//
//  StoredFoods.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/27/25.
//
import SwiftData
import Foundation

@Model
public class StoredFood {
    public var id: UUID = UUID()
    public var name: String
    public var calories: Int
    public var baseCalories: Int
    // Portions fixed to 100 gms by default it seems
    public var portionWeight: Double?
    public var usdaId: Int
    public var udsaSource: String
    
    init(name: String, calories: Int, portionWeight: Double?, usdaId: Int, udsaSource: String) {
        self.name = name
        if (portionWeight != nil) {
            self.calories = Int(Double(calories) * (portionWeight!/100.0))
        } else {
            self.calories = calories
        }
        self.baseCalories = calories
        self.portionWeight = portionWeight
        self.usdaId = usdaId
        self.udsaSource = udsaSource
    }
}
