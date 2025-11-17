//
//  LoginService.swift
//  ProsaHi
//
//  Created by фкшуа on 13/11/25.
//

import Foundation

class RegisterService: NetworkService {
    func register(request: RegisterRequest) async -> (user: RegisterResponse?, error: String?) {
        do {
            let response = try await post("/register", body: request.encodableBody, responseType: RegisterResponse.self)
            
            return (response, nil)
        } catch CustomError.generalError(let error) {
            return (nil, error)
        } catch {
            return (nil, error.localizedDescription)
        }
    }
    
    func getJenisSpesialis() async -> (response: [JenisSpesialisResponse]?, error: String?) {
        do {
            let response = try await get("/jenis-spesialis", responseType: [JenisSpesialisResponse].self)
            
            return (response, nil)
        } catch CustomError.generalError(let error) {
            return (nil, error)
        } catch {
            return (nil, error.localizedDescription)
        }
    }
}
