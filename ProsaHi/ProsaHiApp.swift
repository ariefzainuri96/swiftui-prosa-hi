//
//  ProsaHiApp.swift
//  ProsaHi
//
//  Created by фкшуа on 07/11/25.
//

import SwiftUI

@main
struct ProsaHiApp: App {

    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

struct RootView: View {
    
    private var diModule = DiModule.shared
    
    @StateObject private var sessionManager: SessionManager
    
    init() {
        let sessionManager = diModule.resolve(SessionManager.self)
        _sessionManager = StateObject(wrappedValue: sessionManager)
    }
    
    var body: some View {
        Group {
            switch sessionManager.state {
            case .splash:
                SplashView().task {
                    await sessionManager.checkSession()
                }

            case .loggedIn:
                RouterView()

            case .loggedOut:
                LoginView()
            }
        }
        .animation(.easeInOut, value: sessionManager.state)
        .transition(.opacity)
    }
}
