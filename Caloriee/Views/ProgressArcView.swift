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
        let start = 210.0
        let end = 330.0
            VStack {
                GlassEffectContainer {
                    ZStack {
                        Circle()
                            .fill(Color.clear)
                            .glassEffect(.regular.tint(.gray.opacity(0.2)), in:Arc(start: start, end: end, lineThickness: 8.0))
                        Circle()
                            .fill(Color.clear)
                            .glassEffect(.regular.tint(calorieProgress < 0.80 ? .green : .yellow),
                               in:Arc(start: start, end: (start + (end - start) * calorieProgress), lineThickness: 6.0))
                    }
                    .offset(y:120)
                }
                Text("\((calorieGoal - caloriesConsumed).description)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Calories Remaining")
            }
            .padding()
            .frame(height: 150)
    }
}

#Preview {
    ProgressArcView(caloriesConsumed:  2500, calorieGoal: 2200)
}
