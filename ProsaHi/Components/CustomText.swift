//
//  CustomText.swift
//  ProsaHi
//
//  Created by фкшуа on 12/11/25.
//

import SwiftUI

enum FontWeight {
    case bold
    case medium
    case regular
}

struct CustomText: View {
    var content: String
    var size: CGFloat
    var weight: FontWeight
    var underline: Bool
    var underlineColor: Color?

    init(_ content: String, size: CGFloat = 16, underline: Bool = false, underlineColor: Color? = nil, weight: FontWeight = .regular) {
        self.content = content
        self.size = size
        self.underline = underline
        self.weight = weight
        self.underlineColor = underlineColor
    }

    var body: some View {
        Text(content)
            .font(.custom(getFont(), size: size))
            .underline(underline, color: underlineColor)
    }
    
    private func getFont() -> String {
        return switch weight {
        case .bold:
            "PlusJakartaSans-Bold"
        case .medium:
            "PlusJakartaSans-Medium"
        case .regular:
            "PlusJakartaSans-Regular"
        }
    }
}

#Preview {
    CustomText("asdasd", underline: true, underlineColor: Colors.primary, weight: .regular).foregroundStyle(Colors.primary)
}
