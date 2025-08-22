//
//  BannerView.swift
//  Caloriee
//
//  Created by Ben Haefner on 8/3/25.
//
import SwiftUI

struct BannerView: ViewModifier {
    @Binding var isPresented: Bool
    @State var viewModel: ViewModel
    @State var task: DispatchWorkItem?

    init(isPresented: Binding<Bool>, title: String, message: String, color: Color) {
        self._isPresented = isPresented
        self.viewModel = ViewModel(
            title: title,
            message: message,
            color: color
        )
    }

    func body(content: Content) -> some View {
        ZStack {
            content
            if (isPresented) {
                VStack {
                    Spacer()
                    HStack {
                        VStack (alignment: .leading) {
                            Text(viewModel.bannerData.title)
                                .font(.subheadline)
                                .bold()
                            Text(viewModel.bannerData.message)
                                .font(.caption)
                        }
                        Spacer()
                        Button {
                            isPresented = false
                        } label: {
                            Label("Close", systemImage: "xmark")
                                .labelStyle(.iconOnly)
                        }
                        .buttonStyle(.bordered)
                    }
                    .padding()
                    .glassEffect(
                        .regular.tint(viewModel.bannerData.color.opacity(0.2))
                    )
                    .animation(.easeInOut(duration: 1), value: true)
                    .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
                    .onAppear {
                        self.task = DispatchWorkItem {
                            withAnimation {
                                isPresented = false
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: self.task!)
                    }
                    .onDisappear {
                        self.task?.cancel()
                    }
                }
                .padding()
            }
        }
    }
}

