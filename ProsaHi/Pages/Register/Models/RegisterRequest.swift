//
//  LoginRequest.swift
//  ProsaHi
//
//  Created by фкшуа on 13/11/25.
//

import Foundation

struct RegisterRequest {
    var nama: String = ""
    var username: String = ""
    var password: String = ""
    var jenisAkun: String = ""
    var bidangIlmu: JenisSpesialisResponse? = nil
    var suratTandaRegistrasi: String = ""

    struct Body: Codable {
        let username: String
        let password: String
        let nama: String
        let role: String
        let jenis_id: Int?
        let nostr: String?
    }

    var encodableBody: Body {
        Body(username: username, password: password, nama: nama, role: jenisAkun == "Akun Normal" ? "user" : "tenkes", jenis_id: bidangIlmu?.id, nostr: suratTandaRegistrasi.isEmpty ? nil : suratTandaRegistrasi)
    }

    func isValid() -> Bool {
        !nama.isEmpty &&
        !username.isEmpty &&
        !password.isEmpty &&
        jenisAkun == "Akun Normal" ?
        true :
        (
            bidangIlmu != nil && !suratTandaRegistrasi.isEmpty
        )
    }
}
