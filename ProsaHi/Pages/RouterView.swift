//
//  RouterView.swift
//  ProsaHi
//
//  Created by фкшуа on 10/11/25.
//

import SwiftUI
import Swinject

struct RouterView: View {
    private let diModule = DiModule.shared

    @StateObject private var appRouter: AppRouter

    init() {
        let appRouter = diModule.resolve(AppRouter.self)
        _appRouter = StateObject(wrappedValue: appRouter)
    }

    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack(path: appRouter.pathBinding) {
                destinationView(route: appRouter.initialRoute)
                    .navigationDestination(for: Routes.self) { route in
                        destinationView(route: route)
                    }
            }
        } else {
            NavigationView {
                destinationView(route: appRouter.selectedRoute == nil ? .splash : appRouter.selectedRoute)
            }
        }
    }

    @ViewBuilder
    private func destinationView(route: Routes?) -> some View {

        if let route = route {
            switch route {
            case .main:
                MainView()
            case .login:
                LoginView()
            case .detail:
                DetailView()
            case .register:
                RegisterView()
            case .splash:
                SplashView().task {
                    await appRouter.checkSession()
                }
            case .forgot:
                ForgotView()
            case let .article(content):
                ArticleView(content: content)
            }
        } else {
            EmptyView()
        }
    }
}

#Preview {
    RouterView()
}
