//
//  CustomSymbolProgressViewStyle.swift
//  Caloriee
//
//  Created by Ben Haefner on 8/1/25.
//
import SwiftUI

// TODO: This is not working
struct HeartSymbolProgressView: View {
    @State private var drawnSymbol: Bool = true
    let message: String
    let taskToRun: () async -> Void

    var body: some View {
        VStack {
            Text(message)
            Image(systemName: drawnSymbol ? "arrow.trianglehead.clockwise.heart" : "arrow.down.heart")
                .contentTransition(.symbolEffect(.replace.magic(fallback: .replace.byLayer), options: .repeat(.periodic(delay: 0.5))))
                .task {
                    await taskToRun()
                }
                .task {
                    while !Task.isCancelled {
                        drawnSymbol.toggle()
                        try? await Task.sleep(for: .seconds(1))
                    }
                }
        }
    }
}

#Preview {
    HeartSymbolProgressView(message: "", taskToRun: {
        print("")
    })
}
