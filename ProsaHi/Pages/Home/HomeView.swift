//
//  HomeView.swift
//  ProsaHi
//
//  Created by фкшуа on 25/11/25.
//

import SwiftUI

struct HomeView: View {
    private let diModule = DiModule.shared
    
    @EnvironmentObject private var router: Router<AppRoutes>
    
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
                    CustomText("Apa yang ingin Anda konsultasikan hari ini?", size: 22, weight: .bold)
                    
                    CustomButton(content: "Anak", action: {
                        router.navigate(to: .anak)
                    })
                }
            }
        }
//        .navigationTitle("Consult")
//        .toolbar {
//            ToolbarItem(placement: .principal) {
//                CustomText("Consult")
//            }
//        }
    }
}

#Preview {
    HomeView()
}
