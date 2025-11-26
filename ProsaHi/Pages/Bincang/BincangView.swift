//
//  BincangView.swift
//  ProsaHi
//
//  Created by фкшуа on 25/11/25.
//

import SwiftUI

struct BincangView: View {
    private let diModule = DiModule.shared
    
//    private var appRouter: AppRouter
//    
//    init() {
//        appRouter = diModule.resolve(AppRouter.self)
//    }
    
    var body: some View {
        ZStack {
            Color.white
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Bincang")
                    
                    CustomButton(content: "Anak", action: {
//                        appRouter.navigate(to: .anak)
                    })
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
