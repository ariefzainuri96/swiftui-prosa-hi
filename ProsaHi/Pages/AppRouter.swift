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

    init() {
        if #available(iOS 16.0, *) {
            self.path = NavigationPath()
        }
    }

    func navigate(to route: Routes) {
        if #available(iOS 16.0, *) {
            if var navPath = path as? NavigationPath {
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
}
