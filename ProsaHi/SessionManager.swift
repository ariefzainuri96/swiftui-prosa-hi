//
//  SessionManager.swift
//  ProsaHi
//
//  Created by фкшуа on 10/11/25.
//

import Foundation
import SwiftUI

class SessionManager: ObservableObject {
    enum SessionState {
        case splash
        case loggedIn
        case loggedOut
    }

    @Published var state: SessionState = .splash
    @AppStorage(AppStorageConst.userToken) private var token = ""

    func updateState(value: SessionState) {
        state = value
    }
    
    func checkSession() async {
        // Simulate delay
        try? await Task.sleep(nanoseconds: 1_000_000_000)

        DispatchQueue.main.async {
            if self.token.isEmpty {
                self.state = .loggedOut
            } else {
                self.state = .loggedIn
            }
        }
    }
    
    func login(newToken: String) {
        token = newToken
        state = .loggedIn
    }
    
    func logout() {
        token = ""
        state = .loggedOut
    }
}
