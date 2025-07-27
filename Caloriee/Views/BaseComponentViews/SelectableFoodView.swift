//
//  SelectableFoodView.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/27/25.
//

import SwiftUI

struct SelectableFoodView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    @State private var searchText: String = ""
    @State private var foodSearchResults: [String] = []

    var body: some View {
        VStack (alignment: .center){
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "multiply")
                }
                .buttonStyle(.bordered)
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "checkmark")
                }
                .buttonStyle(.glassProminent)
                
            }
            Spacer()
            if (foodSearchResults.isEmpty) {
                Text("No foods found")
                Spacer()
            } else {
                NavigationStack {
                    List{
                        Section {
                            ForEach(foodSearchResults, id: \.self) { result in
                                Text(result)
                            }
                        }
                    }
                }
                .cornerRadius(20)
            }
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search for foods", text: $searchText)
                // TODO: Search when we change this field
            }
            .padding()
            .glassEffect()
            .cornerRadius(20)
        }
        .padding()
        .presentationDetents([.medium])
    }
}

#Preview {
    SelectableFoodView()
}
