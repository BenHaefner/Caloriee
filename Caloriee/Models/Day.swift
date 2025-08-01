//
//  Day.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/9/25.
//
import SwiftUI
import SwiftData

@Model()
final class Day: Identifiable, Hashable {
    var id = UUID()
    var date: Date

    init(date: Date) {
        self.date = date
    }
}

