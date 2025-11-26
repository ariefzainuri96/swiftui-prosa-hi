//
//  MainView.swift
//  ProsaHi
//
//  Created by фкшуа on 09/11/25.
//

import SwiftUI
import Swinject

struct MainView: View {

    private let diModule = DiModule.shared

    @State private var selectedTab = 0

//    @EnvironmentObject private var router: Router<AppRoutes>

    //    var appRouter: AppRouter
    //
    //    init() {
    //        appRouter = diModule.resolve(AppRouter.self)
    //    }

    var body: some View {

        TabView(selection: $selectedTab) {

            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)

            BincangView()
                .tabItem {
                    Image(systemName: "message")
                    Text("Bincang")
                }
                .tag(1)

        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MainView()
}
