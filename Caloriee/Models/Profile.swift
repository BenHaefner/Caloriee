//
//  Profile.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/9/25.
//
import SwiftUI
import SwiftData

@Model()
final class Profile: Identifiable {
    var id = UUID()
    var calorieGoal: Int
    
    init(calorieGoal: Int) {
        self.calorieGoal = calorieGoal
    }
}
