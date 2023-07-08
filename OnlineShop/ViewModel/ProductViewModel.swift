//
//  ProductViewModel.swift
//  OnlineShop
//
//  Created by Rafael on 01/07/2023.
//

import Foundation

class ProductViewModel: ObservableObject {
    static let shared = ProductViewModel()
    
    
    @Published var jacket = [Product]()
//        Product(id: "1", title: "Jacket", imageUrl: "none", price: 49, description: "Leather jacket"),
//        Product(id: "2", title: "Jacket", imageUrl: "none", price: 64, description: "Leather jacket"),
//        Product(id: "3", title: "Jacket", imageUrl: "none", price: 39, description: "Leather jacket"),
//        Product(id: "4", title: "Jacket", imageUrl: "none", price: 79, description: "Leather jacket"),
//        Product(id: "5", title: "Jacket", imageUrl: "none", price: 59, description: "Leather jacket"),
//        Product(id: "6", title: "Jacket", imageUrl: "none", price: 89, description: "Leather jacket"),
//        Product(id: "7", title: "Jacket", imageUrl: "none", price: 53, description: "Leather jacket")
//    ]
    
    @Published var tshirt = [Product]()
//        Product(id: "1", title: "T-Shirt", imageUrl: "none", price: 49, description: "Cool T-Shirt"),
//        Product(id: "2", title: "T-Shirt", imageUrl: "none", price: 64, description: "Cool T-Shirt"),
//        Product(id: "3", title: "T-Shirt", imageUrl: "none", price: 39, description: "Cool T-Shirt"),
//        Product(id: "4", title: "T-Shirt", imageUrl: "none", price: 79, description: "Cool T-Shirt"),
//        Product(id: "5", title: "T-Shirt", imageUrl: "none", price: 59, description: "Cool T-Shirt"),
//        Product(id: "6", title: "T-Shirt", imageUrl: "none", price: 89, description: "Cool T-Shirt"),
//        Product(id: "7", title: "T-Shirt", imageUrl: "none", price: 53, description: "Cool T-Shirt")
//    ]
    
    @Published var pants = [Product]()
//        Product(id: "1", title: "Pants", imageUrl: "none", price: 49, description: "Style pants"),
//        Product(id: "2", title: "Pants", imageUrl: "none", price: 64, description: "Style pants"),
//        Product(id: "3", title: "Pants", imageUrl: "none", price: 39, description: "Style pants"),
//        Product(id: "4", title: "Pants", imageUrl: "none", price: 79, description: "Style pants"),
//        Product(id: "5", title: "Pants", imageUrl: "none", price: 59, description: "Style pants"),
//        Product(id: "6", title: "Pants", imageUrl: "none", price: 89, description: "Style pants"),
//        Product(id: "7", title: "Pants", imageUrl: "none", price: 53, description: "Style pants")
//    ]
    
    @Published var belts = [Product]()
//        Product(id: "1", title: "Belt", imageUrl: "none", price: 49, description: "Leather belts"),
//        Product(id: "2", title: "Belt", imageUrl: "none", price: 64, description: "Leather belts"),
//        Product(id: "3", title: "Belt", imageUrl: "none", price: 39, description: "Leather belts"),
//        Product(id: "4", title: "Belt", imageUrl: "none", price: 79, description: "Leather belts"),
//        Product(id: "5", title: "Belt", imageUrl: "none", price: 59, description: "Leather belts"),
//        Product(id: "6", title: "Belt", imageUrl: "none", price: 89, description: "Leather belts"),
//        Product(id: "7", title: "Belt", imageUrl: "none", price: 53, description: "Leather belts")
//    ]
    
    @Published var shoes = [Product]()
//        Product(id: "1", title: "Shoes", imageUrl: "none", price: 49, description: "Leather shoes"),
//        Product(id: "2", title: "Shoes", imageUrl: "none", price: 64, description: "Leather shoes"),
//        Product(id: "3", title: "Shoes", imageUrl: "none", price: 39, description: "Leather shoes"),
//        Product(id: "4", title: "Shoes", imageUrl: "none", price: 79, description: "Leather shoes"),
//        Product(id: "5", title: "Shoes", imageUrl: "none", price: 59, description: "Leather shoes"),
//        Product(id: "6", title: "Shoes", imageUrl: "none", price: 89, description: "Leather shoes"),
//        Product(id: "7", title: "Shoes", imageUrl: "none", price: 53, description: "Leather shoes")
//    ]
    
    func getJacketProducts() {
        DatabaseService.shared.getJacket { result in
            switch result {
            case .success(let products):
                self.jacket = products
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getTshirtProducts() {
        DatabaseService.shared.getTshirt { result in
            switch result {
            case .success(let products):
                self.tshirt = products
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getPantsProducts() {
        DatabaseService.shared.getPants { result in
            switch result {
            case .success(let products):
                self.pants = products
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getBeltsProducts() {
        DatabaseService.shared.getBelts { result in
            switch result {
            case .success(let products):
                self.belts = products
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getShoesProducts() {
        DatabaseService.shared.getShoes { result in
            switch result {
            case .success(let products):
                self.shoes = products
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
