//
//  Meals.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/11/25.
//
import SwiftUI
import FoundationModels

@Generable()
enum MealTypes: String, CaseIterable, Identifiable, Codable, ConvertibleFromGeneratedContent {
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
    case snacks = "Snacks"
    case other = "Other"
    
    var id: String { self.rawValue }
    var name: String { self.rawValue }
}
