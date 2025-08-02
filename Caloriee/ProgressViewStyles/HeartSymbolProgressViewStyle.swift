//
//  CustomSymbolProgressViewStyle.swift
//  Caloriee
//
//  Created by Ben Haefner on 8/1/25.
//
import SwiftUI

struct HeartSymbolProgressViewStyle: ProgressViewStyle {
    @State private var drawnSymbol: Bool = true

    func makeBody(configuration: Configuration) -> some View {
        Image(systemName: drawnSymbol ? "arrow.trianglehead.clockwise.heart" : "arrow.down.heart")
            .resizable()
            .contentTransition(.symbolEffect(.replace.magic(fallback: .upUp.byLayer), options: .repeat(.periodic(delay: 0.5))))
            .scaledToFit()
            .frame(height: 75)
            .onAppear {
                Task {
                    while true {
                        drawnSymbol = false
                        try? await Task.sleep(for: .seconds(1))
                        drawnSymbol = true
                        try? await Task.sleep(for: .seconds(1))
                    }
                }
            }
    }
}
