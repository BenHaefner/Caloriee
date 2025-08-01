//
//  EditableRowView.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/31/25.
//

import SwiftUI

struct EditableRowView<Content: View>: View {
    var editing: Bool
    let label: String
    let viewModeValue: String
    let editableContent: () -> Content

    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.headline)
            if !editing {
                Text(viewModeValue)
            } else {
                editableContent()
            }
        }
    }
}
