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
    @StateObject private var globalVM: GlobalViewModel

    private var appRouter: AppRouter

    init() {
        let globalVM = diModule.resolve(GlobalViewModel.self)
        _globalVM = StateObject(wrappedValue: globalVM)
        
        appRouter = diModule.resolve(AppRouter.self)
    }

    var body: some View {
        ZStack {
            Color.white

            ScrollView {
                VStack(alignment: .leading) {
                    CustomTextField(
                        value: $registerVM.registerData.request.nama,
                        label: "Nama", showAsterisk: true,
                        placeholder: "Masukan nama..."
                    ).pad(top: 16)

                    CustomTextField(
                        value: $registerVM.registerData.request.username,
                        label: "Username", showAsterisk: true,
                        placeholder: "Masukan username..."
                    ).pad(top: 16)

                    CustomTextField(
                        value: $registerVM.registerData.request.password,
                        label: "Password",
                        showAsterisk: true,
                        placeholder: "Enter your password...",
                        height: 30,
                        obsecure: registerVM.registerData.obsecure,
                        suffix: {
                            CustomText(
                                registerVM.registerData.obsecure
                                    ? "Show" : "Hide",
                                size: 14, weight: .medium
                            )
                            .foregroundStyle(Colors.gray3)
                            .onTapGesture {
                                registerVM.registerData.obsecure.toggle()
                            }
                        }
                    ).padding(.top, 16)

                    CustomGroupTapInput(label: "Jenis Akun", showAsterisk: true)
                    {
                        HStack(spacing: 16) {
                            CustomTapInput(
                                "Akun Normal",
                                value: $registerVM.registerData.request
                                    .jenisAkun,
                                selected: registerVM.registerData.request
                                    .jenisAkun == "Akun Normal")

                            CustomTapInput(
                                "Tenaga Kesehatan",
                                value: $registerVM.registerData.request
                                    .jenisAkun,
                                selected: registerVM.registerData.request
                                    .jenisAkun == "Tenaga Kesehatan")
                        }
                    }.pad(top: 16)

                    if registerVM.registerData.request.jenisAkun
                        == "Tenaga Kesehatan"
                    {
                        // dropdown                        
                        CustomDropdown(selection: $registerVM.registerData.request.bidangIlmu, valueStr: registerVM.registerData.request.bidangIlmu?.nama ?? "Pilih bidang ilmu...", showAsterisk: true, options: registerVM.bidangIlmuList, label: "Bidang Ilmu") { option in
                            CustomText(option?.nama ?? "")
                        }.pad(top: 16)

                        CustomTextField(
                            value: $registerVM.registerData.request
                                .suratTandaRegistrasi,
                            label: "Surat Tanda Registrasi", showAsterisk: true,
                            placeholder: "Masukan surat tanda registrasi..."
                        ).pad(top: 16)
                    }

                    CustomButton(
                        content: "Register",
                        enable: registerVM.registerData.request.isValid()
                            && registerVM.registerData.state != .loading,
                        state: registerVM.registerData.state,
                        action: {
                            Task {
                                await registerVM.performRegister()
                            }
                        }
                    ).pad(top: 16)

                    HStack(alignment: .center, spacing: 0) {
                        CustomText("Already have an account? ").foregroundStyle(
                            Colors.gray1)
                        CustomText("Login", underline: true, weight: .medium)
                            .foregroundStyle(Colors.gray1)
                            .onTapGesture {
                                appRouter.pop()
                            }
                    }.frame(maxWidth: .infinity, alignment: .center).pad(
                        top: 8, bottom: 16)

                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.horizontal, 16)
            }
        }
        .navigationTitle("Buat Akun")
        .toast($globalVM.toast)
    }
}

#Preview {
    RegisterView()
}
