//
//  JenisSpesialisResponse.swift
//  ProsaHi
//
//  Created by фкшуа on 17/11/25.
//

import Foundation

struct JenisSpesialisResponse: Codable, Hashable {
    let id: Int?
    let nama: String?

    enum CodingKeys: String, CodingKey {
        case id, nama
    }
}

//typealias RegisterResponse = [JenisSpesialisResponse]
