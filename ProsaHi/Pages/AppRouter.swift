//
//  AppRouter.swift
//  ProsaHi
//
//  Created by фкшуа on 10/11/25.
//

import Foundation
import SwiftUI

final class AppRouter: ObservableObject {
    // For iOS 16+
    @Published var path: Any? = nil
    // For iOS 14–15 fallback
    @Published var selectedRoute: Routes? = nil
    @Published var initialRoute: Routes = .splash
    
    @AppStorage(AppStorageConst.userToken) private var token = ""
    
    private var navigateCount = 0

    init() {
        if #available(iOS 16.0, *) {
            self.path = NavigationPath()
        }
    }

    func navigate(to route: Routes, shouldCount: Bool = false) {
        if shouldCount {
            navigateCount += 1
        }
        
        if #available(iOS 16.0, *) {
            if var navPath = path as? NavigationPath {
                navPath.append(route)
                path = navPath
            }
        } else {
            selectedRoute = route
        }
    }
    
    func replace(to route: Routes, shouldCount: Bool = false) {
        if shouldCount {
            navigateCount += 1
        }
        
        if #available(iOS 16.0, *) {
            if var navPath = path as? NavigationPath {
                navPath.removeLast()
                navPath.append(route)
                path = navPath
            }
        } else {
            selectedRoute = route
        }
    }

    func pop() {
        if #available(iOS 16.0, *) {
            if var navPath = path as? NavigationPath, !navPath.isEmpty {
                navPath.removeLast()
                path = navPath
            }
        } else {
            selectedRoute = nil
        }
    }
    
    func popToRoot(useNavigateCount: Bool = false) {
        if #available(iOS 16.0, *) {
            if var navPath = path as? NavigationPath, !navPath.isEmpty {
                navPath.removeLast(useNavigateCount ? navigateCount : navPath.count)
                path = navPath
                
                if useNavigateCount {
                    navigateCount = 0
                }
            }
        } else {
            selectedRoute = nil
        }
    }
    
    func checkSession() async {
        try? await Task.sleep(nanoseconds: 1_000_000_000)

        DispatchQueue.main.async {
            if #available(iOS 16.0, *) {
                self.initialRoute = self.token.isEmpty ? .login : .main
            } else {
                self.selectedRoute = self.token.isEmpty ? .login : .main
            }
        }
    }
    
    func logout() {
        token = ""
        
        if #available(iOS 16.0, *) {
            if var _ = path as? NavigationPath {
                path = NavigationPath([Routes.login])
            }
        } else {
            selectedRoute = .login
        }
    }
    
    func login(_ token: String) {
        self.token = token
        
        if #available(iOS 16.0, *) {
            if var _ = path as? NavigationPath {
                path = NavigationPath([Routes.main])
            }
        } else {
            selectedRoute = .main
        }
    }
}
