//
//  LoginView.swift
//  ProsaHi
//
//  Created by фкшуа on 10/11/25.
//

import SwiftUI
import Swinject

struct RegisterView: View {
    private let diModule = DiModule.shared

    @StateObject private var registerVM = RegisterViewModel()
    
    private var appRouter: AppRouter

    init() {
        appRouter = diModule.resolve(AppRouter.self)
    }

    var body: some View {
        ZStack {
            Color.white

            VStack(alignment: .leading) {
                CustomText("Welcome back", size: 28, weight: .bold).padding(
                    .vertical, 12)

                CustomTextField(
                    value: $registerVM.registerData.request.username,
                    label: "Username", placeholder: "Enter your username...")

                CustomTextField(
                    value: $registerVM.registerData.request.password,
                    label: "Password",
                    placeholder: "Enter your password...",
                    height: 30,
                    obsecure: registerVM.registerData.obsecure,
                    suffix: {
                        CustomText(
                            registerVM.registerData.obsecure ? "Show" : "Hide",
                            size: 14, weight: .medium
                        )
                        .foregroundStyle(Colors.gray3)
                        .onTapGesture {
                            registerVM.registerData.obsecure.toggle()
                        }
                    }
                ).padding(.top, 16)

                Spacer()

                CustomButton(
                    content: "Login",
                    enable: registerVM.registerData.request.isValid() && registerVM.registerData.state != .loading,
                    state: registerVM.registerData.state,
                    action: {
                        Task {
                            await registerVM.performLogin()
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
    RegisterView()
}
