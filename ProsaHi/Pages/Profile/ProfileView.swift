//
//  ProfileView.swift
//  ProsaHi
//
//  Created by фкшуа on 25/11/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color.white
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text("profile?")
                }
            }
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileView()
}
