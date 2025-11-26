//
//  ProsaHiApp.swift
//  ProsaHi
//
//  Created by фкшуа on 07/11/25.
//

import SwiftUI

@main
struct ProsaHiApp: App {
    
    @StateObject private var appRoutes: Router<AppRoutes>  = .init()    

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appRoutes)
        }
    }
}
