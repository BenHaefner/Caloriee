//
//  SelectableFoodView.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/27/25.
//

import SwiftUI
import SwiftData

struct SelectableFoodView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    @State var searchText: String = ""
    @State var foodSearchResults: [StoredFood] = []
    @State var searchTask: Task<Void, Never>? = nil
    @State var selected: StoredFood?
    var onSelected: (StoredFood) -> Void

    // I dont love bringing this into memory but there seems to be
    // some thread safety issues swift data isnt great at handling
    // and this was a suggestion. It also should help with performance
    // of the search itself but i dont like the tradeoff. Might
    // circle back but right now i want to move on.
    @Query()
    private var foods: [StoredFood]
    
    private func getFoodSearchResults() async throws -> Void {
        searchTask?.cancel()
        searchTask = Task {
            do {
                if (searchText.isEmpty) {
                    await MainActor.run { foodSearchResults = [] }
                } else {
                    foodSearchResults = try foods.filter(#Predicate {$0.name.localizedStandardContains(searchText)})
                }
            } catch {
                print(error)
            }
        }
    }

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
                    if (selected != nil) {
                        onSelected(selected!)
                        dismiss()
                    } else {
                        dismiss()
                    }
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
                    List (foodSearchResults, id: \.self, selection: $selected) { result in
                        Text(result.name)
                    }
                }
                .cornerRadius(20)
            }
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search for foods", text: $searchText)
                    .onChange(of: searchText) {
                        Task {
                            try await getFoodSearchResults()
                        }
                    }
            }
            .padding()
            .glassEffect()
            .cornerRadius(20)
        }
        .padding()
        .presentationDetents([.medium])
    }
}
