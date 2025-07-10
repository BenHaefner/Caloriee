//
//  Day.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/9/25.
//
import SwiftUI

struct Event: Identifiable, Hashable {
    var id = UUID()
    var caloriesSpent: Int
    var date: Date
    var meals: [Meal]
}
