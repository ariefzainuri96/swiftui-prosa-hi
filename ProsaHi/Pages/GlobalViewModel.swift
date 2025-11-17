//
//  GlobalViewModel.swift
//  ProsaHi
//
//  Created by фкшуа on 16/11/25.
//

import Foundation

class GlobalViewModel: ObservableObject {
    @Published var shouldUpdateView = false
    @Published var toast: Toast? = nil
    
    func showToast(_ message: String, duration: CGFloat = 2) {
        toast = Toast(message: message)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.toast = nil
        }
    }
}
