//
//  UserProfileView.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/28/25.
//
import SwiftUI

struct GoalSettingView: View {
    @State var goal: Int?
    @State var showBanner: Bool = false
    let isEdit: Bool
    var onSet: (Int) -> Void
    
    init(goal: Int? = nil, isEdit: Bool, onSet: @escaping (Int) -> Void) {
        self.goal = goal
        self.isEdit = isEdit
        self.onSet = onSet
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text(isEdit ? "Set a new goal" : "Set a daily goal for yourself")
                .font(.title)
            
            HStack {
                TextField("Calorie Goal", value: $goal, formatter: NumberFormatter())
                    .font(.system(size: 34))
                    .keyboardType(.numberPad)
                Button {
                    if (goal != nil) {
                        onSet(goal!)
                    } else {
                        showBanner = true
                    }
                } label: {
                    Image(systemName: "checkmark")
                }
                .buttonStyle(.glassProminent)
                .disabled(goal == nil)
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.accent, lineWidth: 2)
            )
            Spacer()
            
        }
        .padding()
        .modifier(BannerView(
            isPresented: $showBanner,
            title: "Invalid goal",
            message: "A valid goal must be a whole number",
            color: Color.red
        ))
    }
}
