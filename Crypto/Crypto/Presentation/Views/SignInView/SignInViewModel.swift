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
    
    static let initialState = SignInState(firstFieldPassword: "", secondFieldPassword: "", email: "", status: false , error: "", alert: false, signInState: false)
    
    init(initialState: SignInState = SignInViewModel.initialState ){
        state = initialState
    }
    
    func verify() {
            var errorMessage = ""

        if self.state.email.isEmpty || self.state.firstFieldPassword.isEmpty || self.state.secondFieldPassword.isEmpty {
                errorMessage = "You can't have an empty field"
            } else if self.state.firstFieldPassword != self.state.secondFieldPassword {
                errorMessage = "The passwords have to be the same"
            } else if self.state.firstFieldPassword.count < 8 || self.state.secondFieldPassword.count < 8 {
                errorMessage = "The password must have more than 8 characters"
            } else if !self.state.email.contains("@") && !self.state.email.contains(".") {
                errorMessage = "The email is not valid"
            }

            if !errorMessage.isEmpty {
                // Set the error message and alert status on the main thread
                DispatchQueue.main.async {
                    self.state.clone(withError: errorMessage,withAlert: true)
                }
            } else {
                Auth.auth().createUser(withEmail: state.email, password: state.firstFieldPassword) { (response, err) in
                    if err != nil {
                        // Set the error message and alert status on the main thread
                        DispatchQueue.main.async {
                            self.state.clone(withError: err!.localizedDescription.description,withAlert: true)
                        }
                    } else {
                        // Set the sign-in state through the SwiftUI view update
                        DispatchQueue.main.async {
                            self.state.clone(withError: "",withAlert: false, withSignInState: true)
                        }
                    }
                }
            }
        }
}
