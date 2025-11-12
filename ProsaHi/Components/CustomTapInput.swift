//
//  CustomTapInput.swift
//  ProsaHi
//
//  Created by фкшуа on 12/11/25.
//

import SwiftUI

struct CustomTapInput: View {
    var value: String
    var selected: Bool
    var action: () -> Void
    
    init(value: String, selected: Bool, action: @escaping @MainActor () -> Void) {
        self.value = value
        self.selected = selected
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            CustomText(value, weight: .medium)
                .foregroundStyle(selected ? Colors.white : Colors.font)
                .padding(.horizontal, 16)
                .padding(.vertical, 10.5)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Colors.gray5, lineWidth: 2)
                )
                .background(selected ? Colors.font : Color.clear)
                .cornerRadius(selected ? 8 : 0)
        }
    }
}

#Preview {
    CustomTapInput(value: "Test", selected: false, action: {})
}
