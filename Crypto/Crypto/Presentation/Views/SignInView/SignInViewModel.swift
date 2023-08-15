//
//  SignInViewModel.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 04/07/2023.
//

import Foundation
import SwiftUI
import Firebase

class SignInViewModel: ObservableObject{
    @Published var state: SignInState
    
    static let initialState = SignInState(firstFieldPassword: "", secondFieldPassword: "", email: "", status: false , error: "", message: "", alert: false, signInState: false)
    
    init(initialState: SignInState = SignInViewModel.initialState ){
        state = initialState
    }
    
    func verify(email: String, firstFieldPassword: String, secondFieldPassword: String) {
        state.email = email
        state.firstFieldPassword = firstFieldPassword
        state.secondFieldPassword = secondFieldPassword
        
        Auth.auth().createUser(withEmail: state.email, password: state.firstFieldPassword) { (response, err) in
            if err != nil {
                // Set the error message and alert status on the main thread
                DispatchQueue.main.async {
                    self.state.error = err!.localizedDescription.description
                    self.state.alert = true
                }
            } else {
                // Set the sign-in state through the SwiftUI view update
                DispatchQueue.main.async {
                    self.state.message = "Registration succeeded"
                    self.state.alert = true
                    self.state = self.state.clone(withError: "",withAlert: false, withSignInState: true)
                }
            }
        }
        
    }
}
