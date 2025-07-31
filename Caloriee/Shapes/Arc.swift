//
//  Arc.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/20/25.
//

import SwiftUI

struct Arc: Shape {
    @State var start: CGFloat
    @State var end: CGFloat
    @State var lineThickness: CGFloat
    func path(in rect: CGRect) -> Path {
        var p = Path()
        p.addArc(
            center: CGPoint(x: rect.midX, y: rect.midY), radius: (rect.width * 3) - lineThickness,
            startAngle: .degrees(start), endAngle: .degrees(end), clockwise: false)
        p.addArc(
            center: CGPoint(x: rect.midX, y: rect.midY), radius: (rect.width * 3) + lineThickness,
      startAngle: .degrees(end), endAngle: .degrees(start), clockwise: true)
    return p
  }
}
