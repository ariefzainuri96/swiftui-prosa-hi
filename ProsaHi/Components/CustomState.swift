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
    
    init(state: PageState, @ViewBuilder content: @escaping () -> Content, @ViewBuilder errorContent: @escaping () -> Content? = {nil}) {
        self.state = state
        self.content = content
        self.errorContent = errorContent
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
        }
    }
}

#Preview {
//    CustomState()
}
