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

    @StateObject private var mainVM = MainViewModel()
    @StateObject private var appRouter: AppRouter

    init() {
        let appRouter = diModule.resolve(AppRouter.self)
        _appRouter = StateObject(wrappedValue: appRouter)
    }

    var body: some View {

        if #available(iOS 16.0, *) {
            NavigationStack(path: appRouter.pathBinding) {
                MainView()
                    .navigationDestination(for: Routes.self) { route in
                        destinationView(route: route)
                    }
            }
        } else {
            NavigationView {
                MainView()
                    .background(
                        NavigationLink(
                            isActive: Binding(
                                get: { appRouter.selectedRoute != nil },
                                set: { isActive in
                                    if !isActive {
                                        appRouter.selectedRoute = nil
                                    }
                                }
                            )
                        ) {
                            destinationView(route: appRouter.selectedRoute)
                        } label: {
                            EmptyView()
                        }
                        .hidden()
                    )
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
            }
        } else {
            EmptyView()
        }
    }
}

#Preview {
    RouterView()
}
