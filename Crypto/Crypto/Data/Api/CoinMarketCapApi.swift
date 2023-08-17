//
//  CoinMarketCapApi.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 08/08/2023.
//

import Foundation
import Firebase


protocol CoinMarketCapApiProtocol {
    
    func logIn(email: String, password: String)
    
}

class FirebaseAuth: AuthRepository{
    func signIn(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        
    }
    
    func resetPassword(email: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        
    }
    
    
    func logIn(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        
        Auth.auth().signIn(withEmail: email, password: password){ [self] (response,
                                                                                      err) in
            
            if err != nil{
                DispatchQueue.main.async {
                    self.error = err!.localizedDescription.description
                    self.message = self.state.error
                    self.alert = true
                }
            }
            
            else{
                DispatchQueue.main.async {
                    self.message = "Login successfull"
                    self.alert = true
                    self.state = self.state.clone(withIsLoggedIn: true,withError: "", withAlert: false)
                }
            }
        }
    }
}
