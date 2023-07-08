//
//  AuthService.swift
//  OnlineShop
//
//  Created by Rafael on 04/07/2023.
//

import Foundation
import FirebaseAuth

class AuthService {
    
    static let shared = AuthService()
    
    private init() { }
    
    let auth = Auth.auth()
    
    var currentUser: User? {
        return auth.currentUser
    }
    
    func signOut() {
        try! auth.signOut()
    }
    
    func signUp(email: String, password: String, completion: @escaping (Result<User, Error>) -> ()) {
        auth.createUser(withEmail: email, password: password) { result, error in
            if let result = result {
                let fbUser = FBUser(id: result.user.uid, name: "", phone: 0, address: "")
               
                DatabaseService.shared.setProfile(user: fbUser) { resultDB in
                    switch resultDB {
                    case .success(_):
                        completion(.success(result.user))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
                completion(.success(result.user))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func signIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> ()) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if let result = result {
                completion(.success(result.user))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    
    
    
    
}
