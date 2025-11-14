//
//  BaseView.swift
//  ProsaHi
//
//  Created by фкшуа on 14/11/25.
//

import SwiftUI

struct BaseView<Content: View>: View {
    
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        content().onDisappear {
            
        }
    }
}

#Preview {
    BaseView {
        Text("tole")
    }
}
