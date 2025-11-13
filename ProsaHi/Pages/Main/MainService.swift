//
//  MainService.swift
//  ProsaHi
//
//  Created by фкшуа on 09/11/25.
//

import Foundation

class MainService: NetworkService {
    func getUser(_ username: String) async -> (user: GithubUserModel?, error: String?) {
        do {
            let user = try await get("/\(username)", responseType: GithubUserModel.self)
            
            return (user, nil)
        } catch CustomError.generalError(let error) {
            return (nil, error)
        } catch {
            return (nil, error.localizedDescription)
        }
    }
}
