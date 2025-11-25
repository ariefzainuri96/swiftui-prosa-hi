//
//  HomeView.swift
//  ProsaHi
//
//  Created by фкшуа on 25/11/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.white
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    CustomText("Apa yang ingin Anda konsultasikan hari ini?", size: 22, weight: .bold)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
