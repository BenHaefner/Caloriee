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
        let startTrim = 210.0
        let endTrim = 330.0
            VStack {
                GlassEffectContainer {
                    ZStack {
                        Circle()
                            .fill(Color.clear)
                            .glassEffect(.regular.tint(.teal.opacity(0.2)), in:Arc(startTrim: startTrim, endTrim: endTrim, lineThickness: 8.0))
                        Circle()
                            .fill(Color.clear)
                            .glassEffect(.regular.tint(.green), in:Arc(startTrim: startTrim, endTrim: (startTrim + (endTrim - startTrim) * calorieProgress), lineThickness: 6.0))
                    }
                    .offset(y:100)
                }
                Text("\(caloriesConsumed.description) cal")
                Text("\(Int(calorieProgress * 100).description)% of your goal")
            }
            .padding()
            .frame(height: 125)
    }
}

struct Arc : Shape {
    @State var startTrim: CGFloat
    @State var endTrim: CGFloat
    @State var lineThickness: CGFloat
    func path(in rect: CGRect) -> Path {
        var p = Path()
        p.addArc(center: CGPoint(x: rect.midX, y:rect.midY), radius: (rect.width*3) - lineThickness, startAngle: .degrees(startTrim), endAngle: .degrees(endTrim), clockwise: false)
        p.addArc(center: CGPoint(x: rect.midX, y:rect.midY), radius: (rect.width*3) + lineThickness, startAngle: .degrees(endTrim), endAngle: .degrees(startTrim), clockwise: true)
        return p
        
    }
}

#Preview {
    ProgressArcView(caloriesConsumed: 1400, calorieGoal: 2200)
}
