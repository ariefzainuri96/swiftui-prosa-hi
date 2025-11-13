//
//  LoginService.swift
//  ProsaHi
//
//  Created by фкшуа on 13/11/25.
//

import Foundation

class LoginService: NetworkService {
    func login(request: LoginRequest) async -> (user: LoginResponse?, error: String?) {
        do {
            let response = try await post("/loginapi", body: request, responseType: LoginResponse.self)
            
            return (response, nil)
        } catch CustomError.generalError(let error) {
            return (nil, error)
        } catch {
            return (nil, error.localizedDescription)
        }
    }
}
