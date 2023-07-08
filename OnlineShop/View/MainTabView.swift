//
//  ContentView.swift
//  OnlineShop
//
//  Created by Rafael on 01/07/2023.
//

import SwiftUI

struct MainTabView: View {
    
    var viewModel: MainTabBarViewModel
    
    var body: some View {
        VStack {
            
            TabView {
                NavigationView {
                    HomeView(viewModel: ProductDetailViewModel(product: Product(title: "", price: 15, description: "")))
                }
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color.gray.opacity(0.2), for: .tabBar)
                
                NavigationView {
                    ProfileView()
                }
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
                    .toolbar(.visible, for: .tabBar)
                    .toolbarBackground(Color.gray.opacity(0.2), for: .tabBar)
                
                CartView(viewModel: CartViewModel.shared)
                    .tabItem {
                        Label("Cart", systemImage: "cart")
                    }
                    .toolbar(.visible, for: .tabBar)
                    .toolbarBackground(Color.gray.opacity(0.2), for: .tabBar)
                
                MoreView()
                    .tabItem {
                        Label("More", systemImage: "ellipsis")
                    }
                    .toolbar(.visible, for: .tabBar)
                    .toolbarBackground(Color.gray.opacity(0.2), for: .tabBar)
            }
            .ignoresSafeArea()
            .accentColor(.black)
            .ignoresSafeArea()
            
            
            
        }
       
    }
}

//struct MainTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTabView(viewModel: MainTabBarViewModel(user: AuthService.shared.currentUser!))
//    }
//}
