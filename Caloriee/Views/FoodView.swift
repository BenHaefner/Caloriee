//
//  FoodView.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/9/25.
//
import SwiftUI

struct FoodView: View {
    let foodItem: FoodItem = FoodItem(calorieCost: 240, name: "Hot Chocolate", description: "A refreshing cup!")
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(foodItem.name)
                    .fontWeight(.bold)
                
                Text(foodItem.description)
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Text(foodItem.calorieCost.description)
        }
        .padding()
    }
}

#Preview {
    FoodView()
}
