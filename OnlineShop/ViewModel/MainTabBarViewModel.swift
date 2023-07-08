//
//  MainTabBarViewModel.swift
//  OnlineShop
//
//  Created by Rafael on 04/07/2023.
//

import Foundation
import FirebaseAuth

class MainTabBarViewModel: ObservableObject {
    
    @Published var user: User
    
    init(user:User) {
        self.user = user
    }
    
    
}
