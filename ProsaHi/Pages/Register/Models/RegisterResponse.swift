//
//  LoginResponse.swift
//  ProsaHi
//
//  Created by фкшуа on 13/11/25.
//

import Foundation

// MARK: - RegisterResponse
struct RegisterResponse: Codable {
    let username, updatedAt, createdAt, nama, nohp, provinsi, kabupaten, kecamatan, kelurahan, alamat, role, mulai, selesai, nostr, fotoURL: String?
    let isVerified: Bool?
    let id, jenisID: Int?

    enum CodingKeys: String, CodingKey {
        case username, nama, nohp, provinsi, kabupaten, kecamatan, kelurahan, alamat, role, mulai, selesai
        case jenisID = "jenis_id"
        case nostr
        case isVerified = "is_verified"
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case id
        case fotoURL = "foto_url"
    }
}
