//
//  CustomButton.swift
//  ProsaHi
//
//  Created by фкшуа on 12/11/25.
//

import SwiftUI

struct CustomButton: View {
    var content: String
    var action: () -> Void
    var isExpanded: Bool
    var enable: Bool
    var horizontalPad: CGFloat
    var verticalPad: CGFloat

    init(
        content: String, horizontalPad: CGFloat = 16, verticalPad: CGFloat = 12,
        isExpanded: Bool = true, enable: Bool = true,
        action: @escaping () -> Void
    ) {
        self.content = content
        self.action = action
        self.enable = enable
        self.horizontalPad = horizontalPad
        self.verticalPad = verticalPad
        self.isExpanded = isExpanded
    }

    var body: some View {
        Button(action: action) {
            CustomText(content, weight: .bold)
                .foregroundStyle(enable ? .white : Colors.font)
                .padding(.horizontal, horizontalPad)
                .padding(.vertical, verticalPad)
        }
        .frame(maxWidth: isExpanded ? .infinity : nil, alignment: .center)
        .background(enable ? Colors.primary : Colors.disable)
        .cornerRadius(8)
    }
}

#Preview {
    CustomButton(content: "Test123", isExpanded: false, action: {})
}
