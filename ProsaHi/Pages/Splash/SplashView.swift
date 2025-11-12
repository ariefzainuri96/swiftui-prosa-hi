//
//  SplashView.swift
//  ProsaHi
//
//  Created by фкшуа on 10/11/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            
            VStack {
                Image(systemName: "swift")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.white)
                Text("ProsaHi")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    SplashView()
}
