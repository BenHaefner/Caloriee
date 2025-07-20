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
                            .glassEffect(.regular.tint(.teal.opacity(0.2)), in:Arc(start: start, end: end, lineThickness: 8.0))
                        Circle()
                            .fill(Color.clear)
                            .glassEffect(.regular.tint(calorieProgress < 0.80 ? .green : .yellow),
                               in:Arc(start: start, end: (start + (end - start) * calorieProgress), lineThickness: 6.0))
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
    @State var start: CGFloat
    @State var end: CGFloat
    @State var lineThickness: CGFloat
    func path(in rect: CGRect) -> Path {
        var p = Path()
        p.addArc(center: CGPoint(x: rect.midX, y:rect.midY), radius: (rect.width*3) - lineThickness, startAngle: .degrees(start), endAngle: .degrees(end), clockwise: false)
        p.addArc(center: CGPoint(x: rect.midX, y:rect.midY), radius: (rect.width*3) + lineThickness, startAngle: .degrees(end), endAngle: .degrees(start), clockwise: true)
        return p
        
    }
}

#Preview {
    ProgressArcView(caloriesConsumed:  1700, calorieGoal: 2200)
}
