//
//  DetailView.swift
//  ProsaHi
//
//  Created by фкшуа on 10/11/25.
//

import SwiftUI

struct DetailView: View {
    private let diModule = DiModule.shared
    
    private var appRouter: AppRouter
    @StateObject private var detailVM = DetailViewModel()
    
    init() {
        appRouter = diModule.resolve(AppRouter.self)
    }
    
    var body: some View {
        ZStack {
            Color.white
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("DetailView").foregroundStyle(.black)
                    
                    Text(detailVM.isUpdateProfile ? "Profile Updated" : "Profile Not Updated")
                    
                    Button(
                        action: {
                            appRouter.navigate(to: .forgot, shouldCount: true)
                        },
                        label: {
                            Text("Forgot")
                        })
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    DetailView()
}
