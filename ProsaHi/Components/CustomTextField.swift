//
//  CustomTextField.swift
//  ProsaHi
//
//  Created by фкшуа on 12/11/25.
//

import SwiftUI

struct CustomTextField: View {
    var label: String?
    var showAsterisk: Bool
    var placeholder: String
    @Binding var value: String
    var textSize: CGFloat
    
    init(value: Binding<String>, label: String? = nil, showAsterisk: Bool = false, placeholder: String = "Input...", textSize: CGFloat = 16) {
        self._value = value
        self.label = label
        self.showAsterisk = showAsterisk
        self.placeholder = placeholder
        self.textSize = textSize
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if label != nil {
                HStack(spacing: 0) {
                    CustomText(label!, weight: .medium)
                    if showAsterisk {
                        Text("*").foregroundStyle(.red)
                    }
                }
            }
            TextField(text: $value, label: {
                CustomText(placeholder).foregroundStyle(Colors.gray3)
            })
            .font(.custom("PlusJakartaSans-Regular", size: textSize))
            .padding(16)
            .background(Colors.gray2)
            .cornerRadius(8)
        }
    }
}

#Preview {
    @State var name = ""
    
    CustomTextField(value: $name, label: "Nama", showAsterisk: true)
}
