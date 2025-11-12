//
//  MainViewModel.swift
//  ProsaHi
//
//  Created by фкшуа on 09/11/25.
//

import Foundation

@MainActor
class MainViewModel: ObservableObject {
    private var mainService = MainService()
    
    @Published var username = ""
    @Published var password = ""
    @Published var state = PageState.idle
    @Published var githubUser = ""
    
    func getUser() async {
        if (username.isEmpty) {
            print("enter username")
            return
        }
        
        let (user, _) = await mainService.getUser(username)
        
        guard let user = user else {
            state = PageState.error
            return
        }
        
        state = PageState.success
        githubUser = user.login ?? ""
    }
}
