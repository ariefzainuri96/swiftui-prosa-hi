//
//  AppRoutes.swift
//  ProsaHi
//
//  Created by фкшуа on 26/11/25.
//

import Foundation
import SwiftUI

enum AppRoutes: Routable {
    case splash
    case main
    case login
//    case detail
    case register
//    case forgot
//    case article(content: String)
    case anak
    case kembang
    
    var body: some View {
        switch self {
        case .splash:
            SplashView()
        case .main:
            MainView()
        case .login:
            LoginView()
        case .register:
            RegisterView()
        case .anak:
            AnakView()
        case .kembang:
            KembangView()
        }
    }
}
