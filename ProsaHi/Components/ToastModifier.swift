//
//  ToastModifier.swift
//  ProsaHi
//
//  Created by фкшуа on 17/11/25.
//

import SwiftUI

struct Toast: Identifiable, Equatable {
    let id = UUID()
    let message: String
}

struct ToastModifier: ViewModifier {
    @Binding var toast: Toast?

    func body(content: Content) -> some View {
        ZStack {
            content

            if let toast = toast {
                VStack {
                    Spacer()
                    Text(toast.message)
                        .padding()
                        .background(Color.black.opacity(0.8))
                        .foregroundStyle(.white)
                        .cornerRadius(8)
                        .padding(.bottom, 40)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
        }
        .animation(.easeInOut, value: toast)
    }
}

#Preview {
//    ToastModifier()
}
