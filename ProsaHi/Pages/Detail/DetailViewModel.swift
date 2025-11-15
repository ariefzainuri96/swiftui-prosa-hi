//
//  DetailViewModel.swift
//  ProsaHi
//
//  Created by фкшуа on 16/11/25.
//

import Combine
import Foundation
import SwiftUI

class DetailViewModel: ObservableObject {
    private let diModule = DiModule.shared

    @Published var isUpdateProfile = false

    private var globalVM: GlobalViewModel

    private var cancellables = Set<AnyCancellable>()

    init() {
        globalVM = diModule.resolve(GlobalViewModel.self)

        setupSubscribers()
    }

    private func setupSubscribers() {
        // Listen to changes
        globalVM.$shouldUpdateView
            .receive(on: RunLoop.main)
            .sink { [weak self] newValue in
                if newValue {
                    // trigger the change like refresh the data or update some state
                    self?.isUpdateProfile.toggle()

                    // IMPORTANT: Reset the flag in the service to prevent
                    // the DetailView from re-updating if it reappears later.
                    self?.globalVM.shouldUpdateView = false
                }
            }
            .store(in: &cancellables)
    }
}
