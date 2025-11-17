//
//  CustomTapInput.swift
//  ProsaHi
//
//  Created by фкшуа on 12/11/25.
//

import SwiftUI

struct CustomTapInput: View {
    var content: String
    @Binding var value: String
    var selected: Bool
    
    init(_ content: String, value: Binding<String>, selected: Bool) {
        self.content = content
        self._value = value
        self.selected = selected
    }
    
    var body: some View {
        Button(action: {
            value = content
        }) {
            CustomText(content, weight: .medium)
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
    @State var value = ""
    
    CustomTapInput("Testing", value: $value, selected: false)
}
