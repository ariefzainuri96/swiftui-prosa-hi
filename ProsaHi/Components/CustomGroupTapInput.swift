//
//  CustomTapInput.swift
//  ProsaHi
//
//  Created by фкшуа on 12/11/25.
//

import SwiftUI

struct CustomGroupTapInput<Content: View>: View {
    var label: String?
    var showAsterisk: Bool
    var textSize: CGFloat
    let groupTap: () -> Content

    init(
        label: String? = nil,
        showAsterisk: Bool = false,
        textSize: CGFloat = 16,
        @ViewBuilder groupTap: @escaping () -> Content
    ) {
        self.label = label
        self.showAsterisk = showAsterisk
        self.textSize = textSize
        self.groupTap = groupTap
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
            groupTap()
        }
    }
}

#Preview {
    @State var value = ""

    CustomGroupTapInput(label: "Tole", showAsterisk: true) {
        HStack {
            CustomTapInput("Test Tap", value: $value, selected: false)
        }
    }
}
