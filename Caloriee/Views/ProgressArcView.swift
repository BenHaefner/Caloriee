//
//  ProgressArcView.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/19/25.
//
import SwiftUI

struct ProgressArcView: View {
    @State var caloriesConsumed: Int
    @State var calorieGoal: Int
    
    var calorieProgress: CGFloat {
        min(CGFloat(caloriesConsumed) / CGFloat(calorieGoal), 1)
    }
    // TODO: Make dynamic for screen size
    var body: some View {
        let startTrim = 210.0/360.0
        let endTrim = 330.0/360.0
        ZStack(alignment: .center) {
            VStack {
                Text("\(caloriesConsumed.description) cal")
                Text("\(Int(calorieProgress*100).description)% of your goal")
            }
            .padding()
            Circle()
                .trim(from: startTrim, to: endTrim)
                .stroke(style: .init(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .foregroundColor(.gray)
                .shadow(radius: 1)
                .frame(width: 300, height: 300)
                .offset(y: 100)
            Circle()
                // These represent the desired angles (210 -> 330)
                .trim(from: startTrim, to: startTrim + (endTrim - startTrim)*calorieProgress)
                .stroke(style: .init(lineWidth: 8, lineCap: .round, lineJoin: .round))
                .foregroundColor(calorieProgress == 1 ? .yellow : .green)
                .shadow(radius: 3)
                .frame(width: 300, height: 300)
                .offset(y: 100)
        }
            .frame(width: 300, height: 150)
            .clipped()

    }
}

#Preview {
    ProgressArcView(caloriesConsumed: 2100, calorieGoal: 2200)
}
