//
//  LoginRequest.swift
//  ProsaHi
//
//  Created by фкшуа on 13/11/25.
//

import Foundation

struct RegisterRequest {
    var username: String = ""
    var password: String = ""
    var nama: String = ""
    var jenisAkun: String = ""
    var bidangIlmu: Int? = nil
    var suratTandaRegistrasi: String = ""
    var fcm_token: String = ""

    struct Body: Codable {
        let username: String
        let password: String
        let nama: String
        let role: String
        let jenis_id: Int
        let nostr: String
    }

    var encodableBody: Body {
        Body(username: username, password: password, nama: nama, role: jenisAkun == "Akun Normal" ? "user" : "tenkes", jenis_id: bidangIlmu ?? 0, nostr: suratTandaRegistrasi)
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
