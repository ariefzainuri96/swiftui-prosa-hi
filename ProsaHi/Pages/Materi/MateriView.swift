//
//  MateriView.swift
//  ProsaHi
//
//  Created by фкшуа on 25/11/25.
//

import SwiftUI

struct MateriView: View {
    var body: some View {
        ZStack {
            Color.white
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Materi apa yang ingin Anda cari?")
                }
            }
        }
        .navigationTitle("Materi")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MateriView()
}
