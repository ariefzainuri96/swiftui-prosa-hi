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

    @StateObject private var mainVM = MainViewModel()
    @StateObject private var sessionManager: SessionManager
    @StateObject private var appRouter: AppRouter

    init() {
        let sessionManager = diModule.resolve(SessionManager.self)
        let appRouter = diModule.resolve(AppRouter.self)

        _sessionManager = StateObject(wrappedValue: sessionManager)
        _appRouter = StateObject(wrappedValue: appRouter)
    }

    var body: some View {
        ZStack {
            Color.white

            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    TextField(text: $mainVM.username) {
                        Text("Username...")
                            .foregroundStyle(.gray)
                    }
                    .foregroundColor(.black)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6).stroke(
                            .gray, lineWidth: 2))

                    Button(action: {
                        Task {
                            await mainVM.getUser()
                        }
                    }) {

                        Text("Check")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 6)
                            .background(.blue)
                            .cornerRadius(6)
                    }.disabled(mainVM.username.isEmpty)

                    if !mainVM.githubUser.isEmpty {
                        Text("GithubUser: \(mainVM.username)")
                            .foregroundColor(
                                .black)
                    }

                    Button(
                        action: {
                            appRouter.navigate(to: Routes.detail)
                        },
                        label: {
                            Text("Detail")
                        })

                    Button(
                        action: {
                            sessionManager.logout()
                        },
                        label: {
                            Text("Logout")
                        })
                }.padding(.horizontal, 10)
            }
        }
        .navigationTitle("Main")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MainView()
}
