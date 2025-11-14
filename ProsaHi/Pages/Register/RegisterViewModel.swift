//
//  LoginViewModel.swift
//  ProsaHi
//
//  Created by фкшуа on 13/11/25.
//

import Foundation
import SwiftUI

class RegisterViewModel: ObservableObject {
    private let diModule = DiModule.shared
    private let registerService = RegisterService()
    
    @Published var registerData = RegisterData()
    
    init() {        
    }
    
    @MainActor
    func performLogin() async {
        // MARK: set fcm
        registerData.request.fcm_token = "123"
        
        registerData.state = .loading
        
        let (response, _) =  await registerService.register(request: registerData.request)
        
        guard let response = response else {
            registerData.state = .error
            return
        }
        
        registerData.state = .success
        
        
    }
}
