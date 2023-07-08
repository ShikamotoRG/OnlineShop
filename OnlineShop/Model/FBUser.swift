//
//  FBUser.swift
//  OnlineShop
//
//  Created by Rafael on 04/07/2023.
//

import Foundation

struct FBUser: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var phone: Int
    var address: String
    
    var representation: [String: Any] {
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["name"] = self.name
        repres["phone"] = self.phone
        repres["address"] = self.address
        return repres
    }
}





