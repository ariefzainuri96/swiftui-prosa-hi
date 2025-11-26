//
//  Router.swift
//  ProsaHi
//
//  Created by фкшуа on 26/11/25.
//

import Foundation
import SwiftUI

public final class Router<Routes: Routable>: ObservableObject, RouteableObject {
    public typealias Destination = Routes

    @Published public var stack: [Destination] = []
    @Published var shouldUpdateView = false
    @Published var toast: Toast? = nil
    
    func showToast(_ message: String, duration: CGFloat = 2) {
        toast = Toast(message: message)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.toast = nil
        }
    }

    public init() {}
}
