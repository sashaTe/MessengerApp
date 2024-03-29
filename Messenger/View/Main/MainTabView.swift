//
//  MainTabView.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 18.01.2024.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    @EnvironmentObject var authViewModel: AuthViewModel
    init() {
    UITabBar.appearance().backgroundColor = UIColor.specBlack
    UITabBar.appearance().unselectedItemTintColor = UIColor.white
    
    }
    var body: some View {
        if let user = authViewModel.currentUser {
            NavigationView {

                TabView(selection: $selectedIndex) {
                        
                        ConversationsView()
                        .onTapGesture {
                            selectedIndex = 0
                        }
                            .tabItem { Image(systemName: "text.bubble") }
                            .tag(0)
                        
                        ChannelsView()
                        .onTapGesture {
                            selectedIndex = 1
                        }
                            .tabItem { Image(systemName: "archivebox") }
                            .tag(1)
                        
                    SettingsView(user: user)
                        .onTapGesture {
                            selectedIndex = 2
                        }
                            .tabItem { Image(systemName: "person.crop.square") }
                            .tag(2)
                            
                    }
                .navigationTitle(tabTitle)
                .navigationBarColor(UIColor(Color.accentColor))


                
            }
        }
        }
    var tabTitle: String {
        switch selectedIndex {
        case 0: return "Chats"
        case 1: return "Channels"
        case 2: return "Settings"
        default: return  ""
        }
    }
}

#Preview {
    MainTabView()
        .environmentObject(AuthViewModel())
}


