//
//  CustomState.swift
//  ProsaHi
//
//  Created by фкшуа on 17/11/25.
//

import SwiftUI

struct CustomState<Content: View>: View {
    var state: PageState
    let content: () -> Content
    let errorContent: () -> Content?
    let reload: () -> Void
    
    init(state: PageState, @ViewBuilder content: @escaping () -> Content, @ViewBuilder errorContent: @escaping () -> Content? = {nil}, reload: @escaping () -> Void = {}) {
        self.state = state
        self.content = content
        self.errorContent = errorContent
        self.reload = reload
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if state == .loading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Colors.font))
            }
            
            if state == .error {
                if errorContent() != nil {
                    errorContent()!
                } else {
                    HStack(spacing: 4) {
                        CustomText("There was an error!")
                        CustomText("Reload?", underline: true, weight: .medium).foregroundStyle(Colors.primary).onTapGesture {
                            reload()
                        }
                    }
                }
            }
            
            if state == .success {
                content()
            }
        }
    }
}

#Preview {
//    CustomState()
}
