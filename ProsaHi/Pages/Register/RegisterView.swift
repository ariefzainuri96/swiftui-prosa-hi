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
                        value: $registerVM.request.nama,
                        label: "Nama", showAsterisk: true,
                        placeholder: "Masukan nama..."
                    ).pad(top: 16)

                    CustomTextField(
                        value: $registerVM.request.username,
                        label: "Username", showAsterisk: true,
                        placeholder: "Masukan username..."
                    ).pad(top: 16)

                    CustomTextField(
                        value: $registerVM.request.password,
                        label: "Password",
                        showAsterisk: true,
                        placeholder: "Enter your password...",
                        height: 30,
                        obsecure: registerVM.obsecure,
                        suffix: {
                            Image(systemName: registerVM.obsecure ? "eye.slash.fill" : "eye.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Colors.gray1)
                            .onTapGesture {
                                registerVM.obsecure.toggle()
                            }
                        }
                    ).padding(.top, 16)

                    CustomGroupTapInput(label: "Jenis Akun", showAsterisk: true)
                    {
                        HStack(spacing: 16) {
                            CustomTapInput(
                                "Akun Normal",
                                value: $registerVM.request
                                    .jenisAkun,
                                selected: registerVM.request
                                    .jenisAkun == "Akun Normal")

                            CustomTapInput(
                                "Tenaga Kesehatan",
                                value: $registerVM.request
                                    .jenisAkun,
                                selected: registerVM.request
                                    .jenisAkun == "Tenaga Kesehatan")
                        }
                    }.pad(top: 16)

                    if registerVM.request.jenisAkun
                        == "Tenaga Kesehatan"
                    {
                        CustomDropdown(
                            selection: $registerVM.request
                                .bidangIlmu, state: registerVM.bidangIlmuState,
                            valueStr: registerVM.request
                                .bidangIlmu?.nama ?? "Pilih bidang ilmu...",
                            showAsterisk: true,
                            options: registerVM.bidangIlmuList,
                            label: "Bidang Ilmu",
                            action: {
                                Task {
                                    await registerVM.getJenisSpesialis()
                                }
                            }
                        ) { option in
                            CustomText(option?.nama ?? "")
                        }.pad(top: 16)

                        CustomTextField(
                            value: $registerVM.request
                                .suratTandaRegistrasi,
                            label: "Surat Tanda Registrasi", showAsterisk: true,
                            placeholder: "Masukan surat tanda registrasi..."
                        ).pad(top: 16)
                    }

                    CustomButton(
                        content: "Register",
                        enable: registerVM.request.isValid()
                            && registerVM.state != .loading,
                        state: registerVM.state,
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
                            .foregroundStyle(Colors.primary)
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
