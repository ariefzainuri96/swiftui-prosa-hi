//
//  AppRouterExtension.swift
//  ProsaHi
//
//  Created by фкшуа on 10/11/25.
//

import SwiftUI

extension AppRouter {
    @available(iOS 16.0, *)
    var pathBinding: Binding<NavigationPath> {
        Binding(
            get: { self.path as? NavigationPath ?? NavigationPath() },
            set: { self.path = $0 }
        )
    }
}
