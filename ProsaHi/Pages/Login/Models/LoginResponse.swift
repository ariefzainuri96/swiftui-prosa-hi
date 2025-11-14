//
//  LoginResponse.swift
//  ProsaHi
//
//  Created by фкшуа on 13/11/25.
//

import Foundation

// MARK: - LoginResponse
struct LoginResponse: Codable {
    let token: String?
    let user: User?
}

// MARK: - User
struct User: Codable {
    let id: Int?
    let username, role, fcmToken, status: String?
    let allowedMenus: [String]?

    enum CodingKeys: String, CodingKey {
        case id, username, role, status
        case allowedMenus = "allowed_menus"
        case fcmToken = "fcm_token"
    }
}
