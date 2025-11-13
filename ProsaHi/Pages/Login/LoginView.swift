//
//  LoginView.swift
//  ProsaHi
//
//  Created by фкшуа on 10/11/25.
//

import SwiftUI
import Swinject

struct LoginView: View {
    private let diModule = DiModule.shared

    @StateObject private var loginVM = LoginViewModel()

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

            VStack(alignment: .leading) {
                CustomText("Welcome back", size: 28, weight: .bold).padding(
                    .vertical, 12)

                CustomTextField(
                    value: $loginVM.loginData.request.username,
                    label: "Username", placeholder: "Enter your username...")

                CustomTextField(
                    value: $loginVM.loginData.request.password,
                    label: "Password",
                    placeholder: "Enter your password...",
                    height: 30,
                    obsecure: loginVM.loginData.obsecure,
                    suffix: {
                        CustomText(
                            loginVM.loginData.obsecure ? "Show" : "Hide",
                            size: 14, weight: .medium
                        )
                        .foregroundStyle(Colors.gray3)
                        .onTapGesture {
                            loginVM.loginData.obsecure.toggle()
                        }
                    }
                ).padding(.top, 16)

                Spacer()

                CustomButton(
                    content: "Login",
                    enable: loginVM.loginData.request.isValid() && loginVM.loginData.state != .loading,
                    state: loginVM.loginData.state,
                    action: {
                        Task {
                            await loginVM.performLogin()
                        }
                    })

                HStack(alignment: .center, spacing: 0) {
                    CustomText("Don't have an account? ").foregroundStyle(
                        Colors.gray1)
                    CustomText("Sign up", underline: true, weight: .medium)
                        .foregroundStyle(Colors.gray1)
                        .onTapGesture {
                            print("signup")
                        }
                }.frame(maxWidth: .infinity, alignment: .center).pad(
                    top: 10, bottom: 16)

            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.horizontal, 16)
        }

    }
}

#Preview {
    LoginView()
}
