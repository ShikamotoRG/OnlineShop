//
//  ProductDetailViewModel.swift
//  OnlineShop
//
//  Created by Rafael on 02/07/2023.
//

import Foundation
import UIKit

class ProductDetailViewModel: ObservableObject {
    
    @Published var product: Product
    @Published var size = ["S", "M", "L", "XL", "2XL", "3XL"]
    @Published var image = UIImage(named: "none")!
    
    
    
    
    init(product: Product) {
        self.product = product
    }
    
    func getPrice(size: String) -> Int {
        switch size {
        case "S": return product.price
        case "M": return Int(Double(product.price) * 1.25)
        case "L": return Int(Double(product.price) * 1.35)
        case "XL": return Int(Double(product.price) * 1.45)
        case "2XL": return Int(Double(product.price) * 1.55)
        case "3XL": return Int(Double(product.price) * 1.65)
        default:
            return 0
        }
    }
    
    func getJacketImage() {
        StorageService.shared.downloadJacketImage(id: product.id) { result in
            switch result {
            case .success(let data):
                if let image = UIImage(data: data) {
                    self.image = image
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getTshirtImage() {
        StorageService.shared.downloadTshirtImage(id: product.id) { result in
            switch result {
            case .success(let data):
                if let image = UIImage(data: data) {
                    self.image = image
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getPantsImage() {
        StorageService.shared.downloadPantsImage(id: product.id) { result in
            switch result {
            case .success(let data):
                if let image = UIImage(data: data) {
                    self.image = image
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getBelts() {
        StorageService.shared.downloadBeltsImage(id: product.id) { result in
            switch result {
            case .success(let data):
                if let image = UIImage(data: data) {
                    self.image = image
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getShoes() {
        StorageService.shared.downloadShoesImage(id: product.id) { result in
            switch result {
            case .success(let data):
                if let image = UIImage(data: data) {
                    self.image = image
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
