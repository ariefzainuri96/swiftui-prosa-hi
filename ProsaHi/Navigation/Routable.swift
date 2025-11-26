//
//  Routable.swift
//  ProsaHi
//
//  Created by фкшуа on 26/11/25.
//

import Foundation
import SwiftUI

public typealias Routable = View & Hashable

public protocol RouteableObject: AnyObject {
    associatedtype Destination: Routable
    
    var stack: [Destination] { get set }
    
    func replaceAll(to destination: Destination)
    func replace(to destination: Destination)
    func navigate(to destination: Destination)
    func navigate(to destinations: [Destination])
    func navigateBack()
    func navigateBack(_ count: Int)
    func navigateBack(to destination: Destination)
    func navigateToRoot()
}

extension RouteableObject {
    public func replaceAll(to destination: Destination) {
        stack = [destination]
    }
    
    public func replace(to destination: Destination) {
        stack.removeLast()
        stack.append(destination)
    }
    
    public func navigate(to destination: Destination) {
        stack.append(destination)
    }
    
    public func navigate(to destinations: [Destination]) {
        stack += destinations
    }
    
    public func navigateBack() {
        stack.removeLast()
    }
    
    public func navigateBack(_ count: Int) {
        guard count > 0 else {
            return
        }
        
        let safeCount = min(count, stack.count)
        stack.removeLast(safeCount)
    }
    
    public func navigateBack(to destination: Destination) {
        if let index = stack.lastIndex(of: destination), index < stack.count {
            stack.removeLast(stack.count - index - 1)
        }
    }
    
    public func navigateToRoot() {
        stack.removeAll()
    }
}
