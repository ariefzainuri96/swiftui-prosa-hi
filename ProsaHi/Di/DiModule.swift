//
//  DiModule.swift
//  ProsaHi
//
//  Created by фкшуа on 10/11/25.
//

import Foundation
import Swinject

class DiModule {
    static let shared = DiModule()
    let container = Container()

    private init() {
        registerDependencies()
    }

    private func registerDependencies() {
        
        /*
         .inObjectScope determine the lifetime of the instance
         */
        
        container.register(AppRouter.self) { _ in
            AppRouter()
        }.inObjectScope(.container)
        
        container.register(GlobalViewModel.self) { _ in
            GlobalViewModel()
        }.inObjectScope(.container)
        
        /*
         // Example when need another object for the constructor injection
         container.register(AppRouter.self) { resolver in
             let networkService = resolver.resolve(NetworkService.self)!
             return HomeViewModel(networkService: networkService)
         }
         */
    }
}

extension DiModule {
    func resolve<T>(_ type: T.Type) -> T {
        guard let dependency = container.resolve(type) else {
            fatalError("Failed to resolve dependency: \(type)")
        }
        return dependency
    }

    func resolve<T, Arg>(_ type: T.Type, argument: Arg) -> T {
        guard let dependency = container.resolve(type, argument: argument)
        else {
            fatalError(
                "Failed to resolve dependency: \(type) with argument: \(argument)"
            )
        }
        return dependency
    }
}
