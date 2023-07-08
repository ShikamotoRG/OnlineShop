//
//  CartViewModel.swift
//  OnlineShop
//
//  Created by Rafael on 02/07/2023.
//

import Foundation

class CartViewModel: ObservableObject {
    
    static let shared = CartViewModel()
    private init() {}
    
    @Published var positions = [Position]()
    
    var cost: Int {
        var sum = 0
        for position in positions {
            sum += position.cost
        }
        return sum
    }
    
    
    func addPosition(_ position: Position) {
        self.positions.append(position)
    }
    
    
    
}
