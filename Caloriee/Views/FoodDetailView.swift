//
//  FoodEditor.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/9/25.
//

import SwiftUI

struct FoodDetailView: View {
    @Binding var foodItem: FoodItem
    let editing: Bool = false
    

    var body: some View {
        List {
            if editing {
                TextField("Name", text: $foodItem.name)
                    .font(.title2)
                TextField("Calorie Count", value: $foodItem.calorieCost, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                TextEditor(text: $foodItem.description)
                    
            } else {
                HStack {
                    Text("Name")
                        .font(.headline)
                    Spacer()
                    Text(foodItem.name)
                }
                HStack {
                    Text("Calories")
                        .font(.headline)
                    Spacer()
                    Text(foodItem.calorieCost.description)
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                HStack {
                    Text("Meal")
                        .font(.headline)
                    Spacer()
                    Text(foodItem.mealType.name)
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                VStack(alignment: .leading) {
                    Text("Description")
                        .font(.headline)
                    Spacer()
                    Text(foodItem.description)
                        .font(.default)
                }
            }
        }
    }
}

#Preview {
    FoodDetailView(foodItem: .constant(FoodItem(calorieCost: 1234, name: "Sample Food", description: "This is a sample description.")))
}
