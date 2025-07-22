//
//  DateSelectorView.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/22/25.
//

import SwiftUI

struct DateSelectorView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var date: Date

    var body: some View {
        DatePicker("Selected Date", selection: $date, displayedComponents: [.date])
            .datePickerStyle(.graphical)
            .toolbar{
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark")
                    }
                }
            }
    }
}

#Preview {
    DateSelectorView(date: .constant(Date.now))
}
