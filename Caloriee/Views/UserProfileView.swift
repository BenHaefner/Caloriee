//
//  UserProfileView.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/28/25.
//
import SwiftUI

struct UserProfileView: View {
    @State var profile: Profile = Profile(calorieGoal: 2200)
    let isEdit: Bool

    var body: some View {
        VStack (alignment: .center) {
            Spacer()
            Text(isEdit ? "Set a new goal" : "Set a daily goal for yourself")
                .font(.title)
            
            TextField("Calorie Goal", value: $profile.calorieGoal, formatter: NumberFormatter())
                .font(.system(size: 34))
                .keyboardType(.numberPad) // TODO: Should i add a text mask?
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.blue, lineWidth: 2)
                )
            Spacer()

        }
        .padding()
        .toolbar {
            ToolbarItem {
                Button {
                    print("Save")
                } label: {
                    Image(systemName: "checkmark")
                }
                .buttonStyle(.glassProminent)

            }
        }
    }
}

#Preview {
    UserProfileView(isEdit: true)
}
