//
//  CoinMarketCapApi.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 08/08/2023.
//

import Foundation
import Firebase
import Combine


protocol CoinMarketCapApiProtocol {
    
    func logIn(email: String, password: String)
    
}

class FirebaseAuth: AuthRepository{
    var state : LoginState
    
    init(state: LoginState) {
        self.state = state
    }
    
    func signIn(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        
    }
    
    func resetPassword(email: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        
    }
    
    
    func logIn(email: String, password: String) -> AnyPublisher<Bool, Error>   {
        
        return Future<Bool, Error> { promise in
                Auth.auth().signIn(withEmail: email, password: password) { (response, err) in
                    if let error = err {
                        promise(.failure(error))
                    } else {
                        promise(.success(true)) // or .success(false) if login is unsuccessful
                    }
                }
            }
            .eraseToAnyPublisher()
    }
}
