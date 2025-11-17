//
//  CustomDropdown.swift
//  ProsaHi
//
//  Created by фкшуа on 17/11/25.
//

import SwiftUI

struct CustomDropdown<T: Hashable, Content: View>: View {
    @Binding var selection: T
    let options: [T]
    let valueStr: String
    let label: String?
    let showAsterisk: Bool
    let content: (T) -> Content
    let state: PageState
    let action: () -> Void

    init(
        selection: Binding<T>, state: PageState = .idle, valueStr: String,
        showAsterisk: Bool, options: [T], label: String?,
        action: @escaping () -> Void = {},
        @ViewBuilder content: @escaping (T) -> Content
    ) {
        self._selection = selection
        self.options = options
        self.valueStr = valueStr
        self.label = label
        self.state = state
        self.showAsterisk = showAsterisk
        self.content = content
        self.action = action
    }

    var body: some View {
        VStack(alignment: .leading) {
            if label != nil {
                HStack(spacing: 0) {
                    CustomText(label!, weight: .medium)
                    if showAsterisk {
                        Text("*").foregroundStyle(.red)
                    }
                }
            }

            Menu {
                ForEach(options, id: \.self) { option in
                    Button(action: {
                        selection = option
                    }) {
                        content(option)
                    }
                }
            } label: {
                HStack {
                    CustomState(
                        state: state,
                        content: {
                            CustomText(valueStr).foregroundStyle(Colors.font)
                        }, reload: {
                            action()
                        })

                    Spacer()
                    Image(systemName: "chevron.down").foregroundStyle(
                        Colors.font)
                }
                .padding(16)
                .background(Colors.gray2)
                .cornerRadius(8)
            }
        }
    }
}

#Preview {
    let options: [JenisSpesialisResponse] = [
        JenisSpesialisResponse(id: 1, nama: "A"),
        JenisSpesialisResponse(id: 2, nama: "B"),
    ]
    @State var data = JenisSpesialisResponse(id: 1, nama: "Test")

    CustomDropdown(
        selection: $data, valueStr: data.nama ?? "", showAsterisk: true,
        options: options, label: "Testing Dropdown"
    ) { option in
        CustomText(option.nama ?? "")
    }
}
