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
            if (isPresented) {
                VStack {
                    HStack {
                        VStack (alignment: .leading) {
                            Text(viewModel.bannerData.title)
                                .font(.title3)
                            Text(viewModel.bannerData.message)
                        }
                        Spacer()
                        Button {
                            isPresented = false
                        } label: {
                            Image(systemName: "xmark")
                        }
                        .buttonStyle(.bordered)
                    }
                    .padding()
                    .glassEffect(
                        .regular.tint(viewModel.bannerData.color.opacity(0.2))
                    )
                    .animation(.easeInOut(duration: 1), value: true)
                    .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
                    .onAppear {
                        // TODO: Move to view model?
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
                    Spacer()
                }
            }
            content
        }
    }
}

