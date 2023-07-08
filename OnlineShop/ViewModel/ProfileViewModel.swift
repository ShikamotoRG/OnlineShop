//
//  ProfileViewModel.swift
//  OnlineShop
//
//  Created by Rafael on 05/07/2023.
//

import Foundation

class ProfileViewModel: ObservableObject {
    

    
    @Published var profile: FBUser
    @Published var orders: [Order] = [Order]()
    
    init(profile: FBUser) {
        self.profile = profile
    }
    
    func getOrders() {
        DatabaseService.shared.getOrders(by: AuthService.shared.currentUser!.uid) { result in
            switch result {
            case .success(let orders):
                self.orders = orders
                
                for (index, order) in self.orders.enumerated() {
                    DatabaseService.shared.getPositions(by: order.id) { result in
                        switch result {
                        case .success(let positions):
                            self.orders[index].positions = positions
                            print(self.orders[index].cost)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                }
                print("Total orders: \(orders.count)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func setProfile() {
        DatabaseService.shared.setProfile(user: self.profile) { result in
            switch result {
            case .success(let user):
                print(user.name)
            case .failure(let error):
                print("Data error: \(error.localizedDescription)")
            }
        }
    }
    
    func getProfile() {
        DatabaseService.shared.getProfile { result in
            switch result {
            case .success(let user):
                self.profile = user
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
