//
//  FoodView.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/9/25.
//
import SwiftUI

struct FoodView: View {
    let foodItem: FoodItem
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(foodItem.name)
                    .fontWeight(.bold)
                
                if !foodItem.comment.isEmpty {
                    Text(foodItem.comment)
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
            }
            
            Spacer()
            
            Text(foodItem.calorieCost.description)
        }
        .padding()
    }
}
