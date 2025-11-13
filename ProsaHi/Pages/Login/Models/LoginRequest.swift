//
//  LoginRequest.swift
//  ProsaHi
//
//  Created by фкшуа on 13/11/25.
//

import Foundation

struct LoginRequest: Codable {
    var username = ""
    var password = ""
    var fcm_token = ""
    
    func isValid() -> Bool {
        !username.isEmpty && !password.isEmpty
    }
}
