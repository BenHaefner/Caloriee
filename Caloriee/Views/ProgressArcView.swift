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
    let screenSize: CGRect = UIScreen.main.bounds
    // TODO: Make dynamic for screen size
    
    var calorieProgress: CGFloat {
        min(CGFloat(caloriesConsumed) / CGFloat(calorieGoal), 1)
    }

    var body: some View {
        ZStack {
            Text("\(caloriesConsumed.description) cal")
                .fixedSize(horizontal: false, vertical: false)
                .multilineTextAlignment(.center)
                .padding()
            Circle()
                .trim(from: 210.0/360.0, to: (330.0/360.0))
                .stroke(style: .init(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .foregroundColor(.gray)
                .shadow(radius: 1)
                .frame(width: 300, height: 300)
                .offset(y: 100)
            Circle()
                // These represent the desired angles (210 -> 330)
                .trim(from: 210.0/360.0, to: (330.0/360.0)*calorieProgress)
                .stroke(style: .init(lineWidth: 8, lineCap: .round, lineJoin: .round))
                .foregroundColor(calorieProgress == 1 ? .yellow : .green)
                .shadow(radius: 3)
                .offset(y: 100)
        }
            .frame(width: 300, height: 150)
            .clipped()

    }
}

#Preview {
    ProgressArcView(caloriesConsumed: 2100, calorieGoal: 2200)
}
