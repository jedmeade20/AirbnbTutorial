//
//  MainTabView.swift
//  AirbnbTutorial
//
//  Created by Johanan Edmeade on 11/17/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            ExploreView()
                .tabItem { Label("Explore", systemImage: "magnifyingglass")
                }
            
            WishListView()
                .tabItem { Label("Wishlist", systemImage: "heart.fill") }
            
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person.crop.circle") }
        }
    }
}

#Preview {
    MainTabView()
}
