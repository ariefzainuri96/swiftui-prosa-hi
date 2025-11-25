//
//  BincangView.swift
//  ProsaHi
//
//  Created by фкшуа on 25/11/25.
//

import SwiftUI

struct BincangView: View {
    var body: some View {
        ZStack {
            Color.white
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Bincang")
                }
            }
        }
        .navigationTitle("Bincang")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    BincangView()
}
