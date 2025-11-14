//
//  LoginViewModel.swift
//  ProsaHi
//
//  Created by фкшуа on 13/11/25.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    private let diModule = DiModule.shared
    private let loginService = LoginService()
    
    @Published var loginData = LoginData()
    
    private var appRouter: AppRouter
    
    init() {
        appRouter = diModule.resolve(AppRouter.self)
    }
    
    @MainActor
    func performLogin() async {
        // MARK: set fcm
        loginData.request.fcm_token = "123"
        
        loginData.state = .loading
        
        let (response, _) =  await loginService.login(request: loginData.request)
        
        guard let response = response else {
            loginData.state = .error
            return
        }
        
        loginData.state = .success
        
        appRouter.login(response.token ?? "")
    }
}
