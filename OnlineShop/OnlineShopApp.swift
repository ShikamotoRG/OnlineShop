//
//  OnlineShopApp.swift
//  OnlineShop
//
//  Created by Rafael on 01/07/2023.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

let screen = UIScreen.main.bounds

@main
struct OnlineShopApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            if let user = AuthService.shared.currentUser {
                if user.uid == "wG5sHEIALEMruz9GIxUmd6FTeao1" {
                    AdminOrdersView()
                } else {
                    let viewModel = MainTabBarViewModel(user: user)
                    MainTabView(viewModel: viewModel)
                }
            } else {
                AuthorizationView()
            }
            
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
      func application(_ application: UIApplication,
                       didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
          print("App Delegat configuration finish")

        return true
      }
    }
}
