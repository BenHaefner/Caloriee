//
//  ContentView.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/8/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack { // Vertical Stack
            Text("Welcome to Pokemon!")
            Text("Are you a")
            HStack { // Horizontal Stack
                Button(action: {
                    print("Boy!")
                }, label: {
                    Text("Boy")
                        .foregroundStyle(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .cornerRadius(8)
                        .glassEffect(
                            .regular.tint(.cyan).interactive()
                        )
                })
                Button(action: {
                    print("Girl!")
                }, label: {
                    Text("Girl")
                        .foregroundStyle(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .cornerRadius(8)
                        .glassEffect(
                            .regular.tint(.pink).interactive()
                        )
                })
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
