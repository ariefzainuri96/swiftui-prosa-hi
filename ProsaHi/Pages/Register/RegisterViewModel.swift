//
//  LoginViewModel.swift
//  ProsaHi
//
//  Created by фкшуа on 13/11/25.
//

import Foundation
import SwiftUI
import Combine

class RegisterViewModel: ObservableObject {
    private let diModule = DiModule.shared
    private let registerService = RegisterService()
    
    @Published var request = RegisterRequest()
    @Published var state = PageState.idle
    @Published var obsecure = true
    @Published var bidangIlmuList: [JenisSpesialisResponse] = []
    @Published var bidangIlmuState = PageState.idle
    
    private var globalVM: GlobalViewModel
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        globalVM = diModule.resolve(GlobalViewModel.self)
        
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        // Listen to changes
        $request
            .receive(on: RunLoop.main)
            .sink { [weak self] newValue in
                if newValue.jenisAkun == "Tenaga Kesehatan" && self?.bidangIlmuState == .idle {
                    Task {
                        await self?.getJenisSpesialis()
                    }
                }
            }
            .store(in: &cancellables)
    }
    
    @MainActor
    func performRegister() async {
        state = .loading
        
        let (response, _) =  await registerService.register(request: request)
        
        guard let response = response else {
            state = .error
            return
        }
        
        state = .success
        
        globalVM.showToast("Berhasil membuat akun, silahkan login!")
    }
    
    @MainActor
    func getJenisSpesialis() async {
        print("getJenisSpesialis")
        
        bidangIlmuState = .loading
        
        let (response, _) = await registerService.getJenisSpesialis()
        
        guard let response = response else {
            bidangIlmuState = .error
            return
        }
        
        bidangIlmuState = .success
        bidangIlmuList = response
    }
}
