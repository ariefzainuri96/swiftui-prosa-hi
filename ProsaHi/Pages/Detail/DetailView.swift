//
//  DetailView.swift
//  ProsaHi
//
//  Created by фкшуа on 10/11/25.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ZStack {
            Color.white
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("DetailView").foregroundStyle(.black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    DetailView()
}
