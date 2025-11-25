//
//  MainView.swift
//  ProsaHi
//
//  Created by фкшуа on 09/11/25.
//

import SwiftUI
import Swinject

struct MainView: View {

    @State private var selectedTab = 0
    
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
            
            BincangView()
                .tabItem {
                    Image(systemName: "message")
                    Text("Bincang")
                }
                .tag(1)
            
            MateriView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("Materi")
                }
                .tag(2)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
                .tag(3)
        }
        
//        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MainView()
}
