//
//  Food.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/9/25.
//
import SwiftUI

struct Food: Identifiable, Hashable {
    var id = UUID()
    var calorieCost: Int
    var name: String
    var description: String

}
