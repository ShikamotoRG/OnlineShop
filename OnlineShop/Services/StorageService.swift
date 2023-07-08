//
//  StorageService.swift
//  OnlineShop
//
//  Created by Rafael on 05/07/2023.
//

import Foundation
import FirebaseStorage

class StorageService {
    
    static let shared = StorageService()
    private init() { }
    
    private let storage = Storage.storage().reference()
//    private var productRef: StorageReference { storage.child("product") }
    private var jacketRef: StorageReference { storage.child("jasket") }
    private var tshirtRef: StorageReference { storage.child("tshirt") }
    private var pantsRef: StorageReference { storage.child("pants") }
    private var beltsRef: StorageReference { storage.child("belts") }
    private var shoesRef: StorageReference { storage.child("shoes") }

    
    /*
    func upload(id: String, image: Data, complition: @escaping(Result<String, Error>) -> ()) {

        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"

        productRef.child(id).putData(image, metadata: metadata) { metadata, error in
            guard let metadata = metadata else {
                if let error = error {
                    complition(.failure(error))
                }
                return
            }
            complition(.success("The size of the file is: \(metadata.size)"))
        }
    }
     
     func downloadProductImage(id: String, complition: @escaping(Result<Data, Error>) -> ()) {
         productRef.child(id).getData(maxSize: 2 * 1024 * 1024) { data, error in
             guard let data = data else {
                 if let error = error {
                     complition(.failure(error))
                 }
                 return
             }
             complition(.success(data))
         }
     }
     

     
     */
    
//MARK: Upload
    
    func jacketUpload(id: String, image: Data, complition: @escaping(Result<String, Error>) -> ()) {
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        
        jacketRef.child(id).putData(image, metadata: metadata) { metadata, error in
            guard let metadata = metadata else {
                if let error = error {
                    complition(.failure(error))
                }
                return
            }
            complition(.success("The size of the file is: \(metadata.size)"))
        }
    }
    
    func tshirtUpload(id: String, image: Data, complition: @escaping(Result<String, Error>) -> ()) {
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        
        tshirtRef.child(id).putData(image, metadata: metadata) { metadata, error in
            guard let metadata = metadata else {
                if let error = error {
                    complition(.failure(error))
                }
                return
            }
            complition(.success("The size of the file is: \(metadata.size)"))
        }
    }
    
    func pantsUpload(id: String, image: Data, complition: @escaping(Result<String, Error>) -> ()) {
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        
        pantsRef.child(id).putData(image, metadata: metadata) { metadata, error in
            guard let metadata = metadata else {
                if let error = error {
                    complition(.failure(error))
                }
                return
            }
            complition(.success("The size of the file is: \(metadata.size)"))
        }
    }
    
    func beltsUpload(id: String, image: Data, complition: @escaping(Result<String, Error>) -> ()) {
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        
        beltsRef.child(id).putData(image, metadata: metadata) { metadata, error in
            guard let metadata = metadata else {
                if let error = error {
                    complition(.failure(error))
                }
                return
            }
            complition(.success("The size of the file is: \(metadata.size)"))
        }
    }
    
    func shoesUpload(id: String, image: Data, complition: @escaping(Result<String, Error>) -> ()) {
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        
        shoesRef.child(id).putData(image, metadata: metadata) { metadata, error in
            guard let metadata = metadata else {
                if let error = error {
                    complition(.failure(error))
                }
                return
            }
            complition(.success("The size of the file is: \(metadata.size)"))
        }
    }
    
    
    //MARK: Download
    
    
    func downloadJacketImage(id: String, complition: @escaping(Result<Data, Error>) -> ()) {
        jacketRef.child(id).getData(maxSize: 2 * 1024 * 1024) { data, error in
            guard let data = data else {
                if let error = error {
                    complition(.failure(error))
                }
                return
            }
            complition(.success(data))
        }
    }
    
    
    func downloadTshirtImage(id: String, complition: @escaping(Result<Data, Error>) -> ()) {
        tshirtRef.child(id).getData(maxSize: 2 * 1024 * 1024) { data, error in
            guard let data = data else {
                if let error = error {
                    complition(.failure(error))
                }
                return
            }
            complition(.success(data))
        }
    }
    
    
    func downloadPantsImage(id: String, complition: @escaping(Result<Data, Error>) -> ()) {
        pantsRef.child(id).getData(maxSize: 2 * 1024 * 1024) { data, error in
            guard let data = data else {
                if let error = error {
                    complition(.failure(error))
                }
                return
            }
            complition(.success(data))
        }
    }
    
    
    func downloadBeltsImage(id: String, complition: @escaping(Result<Data, Error>) -> ()) {
        beltsRef.child(id).getData(maxSize: 2 * 1024 * 1024) { data, error in
            guard let data = data else {
                if let error = error {
                    complition(.failure(error))
                }
                return
            }
            complition(.success(data))
        }
    }
    
    
    func downloadShoesImage(id: String, complition: @escaping(Result<Data, Error>) -> ()) {
        shoesRef.child(id).getData(maxSize: 2 * 1024 * 1024) { data, error in
            guard let data = data else {
                if let error = error {
                    complition(.failure(error))
                }
                return
            }
            complition(.success(data))
        }
    }
    
    
    
    
}
