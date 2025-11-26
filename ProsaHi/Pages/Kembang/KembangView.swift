//
//  KembangView.swift
//  ProsaHi
//
//  Created by фкшуа on 26/11/25.
//

import SwiftUI

struct KembangView: View {
    @EnvironmentObject private var router: Router<AppRoutes>
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack {
                CustomButton(content: "Back to main", action: {
                    router.navigateBack(to: .main)
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    KembangView()
}
