//
//  CustomTextField.swift
//  ProsaHi
//
//  Created by фкшуа on 12/11/25.
//

import SwiftUI

struct CustomTextField<Prefix: View, Suffix: View>: View {
    var label: String?
    var showAsterisk: Bool
    var placeholder: String
    @Binding var value: String
    var textSize: CGFloat
    var obsecure: Bool
    var height: CGFloat?
    let prefix: () -> Prefix
    let suffix: () -> Suffix

    init(
        value: Binding<String>, label: String? = nil,
        showAsterisk: Bool = false, placeholder: String = "Input...",
        textSize: CGFloat = 16, height: CGFloat? = 24, obsecure: Bool = false,
        @ViewBuilder prefix: @escaping () -> Prefix = { EmptyView() },
        @ViewBuilder suffix: @escaping () -> Suffix = { EmptyView() }
    ) {
        self._value = value
        self.label = label
        self.showAsterisk = showAsterisk
        self.placeholder = placeholder
        self.textSize = textSize
        self.obsecure = obsecure
        self.height = height
        self.prefix = prefix
        self.suffix = suffix
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

            HStack {
                prefix()
                input()
                    .font(.custom("PlusJakartaSans-Regular", size: textSize))
                    .frame(maxWidth: .infinity, minHeight: height)
                suffix()
            }
            .padding(16)
            .background(Colors.gray2)
            .cornerRadius(8)
        }
    }

    @ViewBuilder
    func input() -> some View {
        if obsecure {
            SecureField(
                text: $value,
                label: {
                    CustomText(placeholder).foregroundStyle(Colors.gray3)
                })
        } else {
            TextField(
                text: $value,
                label: {
                    CustomText(placeholder).foregroundStyle(Colors.gray3)
                })
        }
    }
}

#Preview {
    @State var name = ""

    CustomTextField(value: $name, label: "Nama", showAsterisk: true)
}
