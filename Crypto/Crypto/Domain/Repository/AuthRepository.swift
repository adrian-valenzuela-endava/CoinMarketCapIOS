//
//  AuthRepository.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 16/08/2023.
//

import Foundation
import Combine
import Firebase

protocol AuthRepository{
    func signIn(email: String, password: String) -> AnyPublisher<Bool, CryptoErrors>
    func logIn(email: String, password: String) -> AnyPublisher<Bool, CryptoErrors>
    func resetPassword(email: String) -> AnyPublisher<Bool, CryptoErrors>
    func logOut() -> AnyPublisher<Bool, CryptoErrors>
    func hasUserSession() -> AnyPublisher<Bool, CryptoErrors>
}

class FirebaseAuth: AuthRepository{
    
    private var firebaseAuth: Auth
    
    init(firebaseAuth: Auth = Auth.auth()){
        self.firebaseAuth = firebaseAuth
    }
    
    func logOut() -> AnyPublisher<Bool, CryptoErrors> {
        return Future<Bool, CryptoErrors> { promise in
            do {
                try self.firebaseAuth.signOut()
                promise(.success(true))
            } catch {
                promise(.failure(CryptoErrors.logOutError))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func signIn(email: String, password: String) -> AnyPublisher<Bool, CryptoErrors> {
        return Future<Bool, CryptoErrors> { promise in
            self.firebaseAuth.createUser(withEmail: email, password: password) { (response, err) in
                guard let _  = err else {
                    promise(.success(true))
                    return
                }
                promise(.failure(.newUserError))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func resetPassword(email: String) -> AnyPublisher<Bool, CryptoErrors>  {
        return Future<Bool, CryptoErrors> { promise in
            self.firebaseAuth.sendPasswordReset(withEmail: email) { (response) in
                promise(.success(true))
            }
        }
        .eraseToAnyPublisher()
    }
    
    
    func logIn(email: String, password: String) -> AnyPublisher<Bool, CryptoErrors>   {
        
        return Future<Bool, CryptoErrors> { promise in
            self.firebaseAuth.signIn(withEmail: email, password: password) { (response, err) in
                guard let _  = err else {
                    // This is temporal, afterwards it's going to be cleaner
                    // let authToken: String = response?.user.uid
                    KmpCmcClient.shared.setAuthToken("")
                    promise(.success(true))
                    return
                }
                promise(.failure(.badCredentials))
            }
        }
        .eraseToAnyPublisher()
    }

    func hasUserSession() -> AnyPublisher<Bool, CryptoErrors>   {
        return Future<Bool, CryptoErrors> { promise in
            promise(.success(self.firebaseAuth.currentUser != nil))
        }
        .eraseToAnyPublisher()
    }
}

