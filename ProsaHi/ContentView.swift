//
//  ContentView.swift
//  ProsaHi
//
//  Created by фкшуа on 26/11/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var router: Router<AppRoutes>
    
    @AppStorage(AppStorageConst.userToken) private var token = ""
    
    var body: some View {
        RoutingView(stack: $router.stack) {
            SplashView().task {
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                
                DispatchQueue.main.async {
                    router.replaceAll(to: self.token.isEmpty ? .login : .main)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
