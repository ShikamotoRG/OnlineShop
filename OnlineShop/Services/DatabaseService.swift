//
//  DatabaseService.swift
//  OnlineShop
//
//  Created by Rafael on 04/07/2023.
//

import Foundation
import FirebaseFirestore

class DatabaseService {
    static let shared = DatabaseService()
    private let db = Firestore.firestore()
    
    private var usersRef: CollectionReference { return db.collection("users") }
    private var ordersRef: CollectionReference { return db.collection("orders") }
    //private var productsRef: CollectionReference { db.collection("products") }
    private var jacketRef: CollectionReference { db.collection("jasket") }
    private var tshirtRef: CollectionReference { db.collection("tshirt") }
    private var pantsRef: CollectionReference { db.collection("pants") }
    private var beltsRef: CollectionReference { db.collection("belts") }
    private var shoesRef: CollectionReference { db.collection("shoes") }
    
    
    private init() { }
    
    
    func getPositions(by orderID: String, completion: @escaping (Result<[Position], Error>) -> ()) {
        let positionsRef = ordersRef.document(orderID).collection("positions")
        positionsRef.getDocuments { qSnap, error in
            
            if let querySnapshot = qSnap {
                var positions = [Position]()
                
                for doc in querySnapshot.documents {
                    if let position = Position(doc: doc) {
                        positions.append(position)
                    }
                }
                completion(.success(positions))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    
    func getOrders(by userID: String?, completion: @escaping (Result<[Order], Error>) -> ()) {
        self.ordersRef.getDocuments { qSnap, error in
            
            if let qSnap = qSnap {
                var orders = [Order]()
                for doc in qSnap.documents {
                    if let userID = userID {
                        if let order = Order(doc: doc), order.userID == userID {
                            orders.append(order)
                        }
                    } else { // Ветка для админа
                        if let order = Order(doc: doc) {
                            orders.append(order)
                        }
                    }
                }
                completion(.success(orders))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    
    func setOrder(order: Order, completion: @escaping (Result<Order, Error>) -> ()) {
        ordersRef.document(order.id).setData(order.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                
                self.setPositions(to: order.id, positions: order.positions) { result in
                    switch result {
                    case .success(let positions):
                        print(positions.count)
                        completion(.success(order))
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
                
            }
        }
    }
    
    func setPositions(to orderId: String, positions: [Position], completion: @escaping (Result<[Position], Error>) -> ()) {
        let positionsRef = ordersRef.document(orderId).collection("positions")
        
        for position in positions {
            positionsRef.document(position.id).setData(position.representation)
        }
        
        completion(.success(positions))
    }
    
    func setProfile(user: FBUser, completion: @escaping (Result<FBUser, Error>) -> ()) {
        usersRef.document(user.id).setData(user.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }
    
    func getProfile(by userId: String? = nil, complition: @escaping (Result<FBUser, Error>) -> ()) {
        
        usersRef.document(userId != nil ? userId! : AuthService.shared.currentUser!.uid).getDocument { docSnapshot, error in
            guard let snap = docSnapshot else { return }
            guard let data = snap.data() else { return }
            guard let userName = data["name"] as? String else { return }
            guard let id = data["id"] as? String else { return }
            guard let phone = data["phone"] as? Int else { return }
            guard let address = data["address"] as? String else { return }
            
            let user = FBUser(id: id, name: userName, phone: phone, address: address)
            
            complition(.success(user))
        }
    }
    
    //MARK: Firebase Upload Images
    
    func setJacket(product: Product, image: Data, complition: @escaping (Result<Product, Error>) -> ()) {
        StorageService.shared.jacketUpload(id: product.id, image: image) { result in
            switch result {
            case .success(let sizeInfo):
                print(sizeInfo)
                self.jacketRef.document(product.id).setData(product.representation) { error in
                    if let error = error {
                        complition(.failure(error))
                    } else {
                        complition(.success(product))
                    }
                }
            case .failure(let error):
                complition(.failure(error))
            }
        }
    }
    
    func setTshirt(product: Product, image: Data, complition: @escaping (Result<Product, Error>) -> ()) {
        StorageService.shared.tshirtUpload(id: product.id, image: image) { result in
            switch result {
            case .success(let sizeInfo):
                print(sizeInfo)
                self.tshirtRef.document(product.id).setData(product.representation) { error in
                    if let error = error {
                        complition(.failure(error))
                    } else {
                        complition(.success(product))
                    }
                }
            case .failure(let error):
                complition(.failure(error))
            }
        }
    }
    
    func setPants(product: Product, image: Data, complition: @escaping (Result<Product, Error>) -> ()) {
        StorageService.shared.pantsUpload(id: product.id, image: image) { result in
            switch result {
            case .success(let sizeInfo):
                print(sizeInfo)
                self.pantsRef.document(product.id).setData(product.representation) { error in
                    if let error = error {
                        complition(.failure(error))
                    } else {
                        complition(.success(product))
                    }
                }
            case .failure(let error):
                complition(.failure(error))
            }
        }
    }
    
    func setBelts(product: Product, image: Data, complition: @escaping (Result<Product, Error>) -> ()) {
        StorageService.shared.beltsUpload(id: product.id, image: image) { result in
            switch result {
            case .success(let sizeInfo):
                print(sizeInfo)
                self.beltsRef.document(product.id).setData(product.representation) { error in
                    if let error = error {
                        complition(.failure(error))
                    } else {
                        complition(.success(product))
                    }
                }
            case .failure(let error):
                complition(.failure(error))
            }
        }
    }
    
    func setShoes(product: Product, image: Data, complition: @escaping (Result<Product, Error>) -> ()) {
        StorageService.shared.shoesUpload(id: product.id, image: image) { result in
            switch result {
            case .success(let sizeInfo):
                print(sizeInfo)
                self.shoesRef.document(product.id).setData(product.representation) { error in
                    if let error = error {
                        complition(.failure(error))
                    } else {
                        complition(.success(product))
                    }
                }
            case .failure(let error):
                complition(.failure(error))
            }
        }
    }
    
    
    
    //MARK: Download Images on Device
    
    func getJacket(complition: @escaping (Result<[Product], Error>) -> ()) {
        self.jacketRef.getDocuments { qSnap, error in
            guard let qSnap = qSnap else {
                if let error = error {
                    complition(.failure(error))
                }
                return
            }
            let docs = qSnap.documents
            var products = [Product]()
            for doc in docs {
                guard let product = Product(doc: doc) else {return}
                products.append(product)
            }
            complition(.success(products))
        }
        
    }
    

    func getTshirt(complition: @escaping (Result<[Product], Error>) -> ()) {
        self.tshirtRef.getDocuments { qSnap, error in
            guard let qSnap = qSnap else {
                if let error = error {
                    complition(.failure(error))
                }
                return
            }
            let docs = qSnap.documents
            var products = [Product]()
            for doc in docs {
                guard let product = Product(doc: doc) else {return}
                products.append(product)
            }
            complition(.success(products))
        }
        
    }
    
    
    func getPants(complition: @escaping (Result<[Product], Error>) -> ()) {
        self.pantsRef.getDocuments { qSnap, error in
            guard let qSnap = qSnap else {
                if let error = error {
                    complition(.failure(error))
                }
                return
            }
            let docs = qSnap.documents
            var products = [Product]()
            for doc in docs {
                guard let product = Product(doc: doc) else {return}
                products.append(product)
            }
            complition(.success(products))
        }
        
    }
    
    
    func getBelts(complition: @escaping (Result<[Product], Error>) -> ()) {
        self.beltsRef.getDocuments { qSnap, error in
            guard let qSnap = qSnap else {
                if let error = error {
                    complition(.failure(error))
                }
                return
            }
            let docs = qSnap.documents
            var products = [Product]()
            for doc in docs {
                guard let product = Product(doc: doc) else {return}
                products.append(product)
            }
            complition(.success(products))
        }
        
    }
    
    
    func getShoes(complition: @escaping (Result<[Product], Error>) -> ()) {
        self.shoesRef.getDocuments { qSnap, error in
            guard let qSnap = qSnap else {
                if let error = error {
                    complition(.failure(error))
                }
                return
            }
            let docs = qSnap.documents
            var products = [Product]()
            for doc in docs {
                guard let product = Product(doc: doc) else {return}
                products.append(product)
            }
            complition(.success(products))
        }
        
    }
}






