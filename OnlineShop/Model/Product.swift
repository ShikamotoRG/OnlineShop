//
//  Product.swift
//  OnlineShop
//
//  Created by Rafael on 01/07/2023.
//

import Foundation
import FirebaseFirestore

struct Product: Identifiable {
    var id: String
    var title: String
    var imageUrl: String = ""
    var price: Int
    var description: String
    
    // var orderCount: Int
    // var isRecomend: Bool
    
    var representation: [String: Any] {
        
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["title"] = self.title
        repres["price"] = self.price
        repres["description"] = self.description
        return repres
    }
    
    internal init(id: String = UUID().uuidString,
                  title: String,
                  imageUrl: String = "",
                  price: Int,
                  description: String) {
        self.id = id
        self.title = title
        self.imageUrl = imageUrl
        self.price = price
        self.description = description
    }
    
    init?(doc: QueryDocumentSnapshot) {
        let data = doc.data()
        guard let id = data["id"] as? String else { return nil }
        guard let title = data["title"] as? String else { return nil }
        guard let price = data["price"] as? Int else { return nil }
        guard let description = data["description"] as? String else { return nil }
        
        self.id = id
        self.title = title
        self.price = price
        self.description = description
    }
}


