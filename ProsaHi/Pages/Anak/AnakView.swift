//
//  AnakView.swift
//  ProsaHi
//
//  Created by фкшуа on 25/11/25.
//

import SwiftUI

struct AnakView: View {
    private let diModule = DiModule.shared
    
    @EnvironmentObject private var router: Router<AppRoutes>
    
    @AppStorage(AppStorageConst.userToken) private var token = ""
    
//    private var appRouter: AppRouter
//    
//    init() {
//        appRouter = diModule.resolve(AppRouter.self)
//    }

    var body: some View {
        VStack {
            Text( /*@START_MENU_TOKEN@*/"Hello, World!" /*@END_MENU_TOKEN@*/)
            
            CustomButton(content: "Logout", action: {
                token = ""
                router.replaceAll(to: .login)
            })
            
            CustomButton(content: "Kembang", action: {
                router.replace(to: .kembang)
            })
        }
        .navigationTitle("Anak")
    }
}

#Preview {
    AnakView()
}
