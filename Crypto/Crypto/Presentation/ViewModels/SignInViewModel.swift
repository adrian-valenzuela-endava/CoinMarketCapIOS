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
    @Published var firstFieldPassword: String
    @Published var secondFieldPassword: String
    @Published var email: String
    @Published var status: Bool
    @Published var error: String
    @Published var alert: Bool
    @Published var signInState: Bool
    
    init() {
        firstFieldPassword = ""
        secondFieldPassword = ""
        email = ""
        status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
        error = ""
        alert = false
        signInState = false
    }
    
    func verify() {
            var errorMessage = ""

            if self.email.isEmpty || self.firstFieldPassword.isEmpty || self.secondFieldPassword.isEmpty {
                errorMessage = "You can't have an empty field"
            } else if self.firstFieldPassword != self.secondFieldPassword {
                errorMessage = "The passwords have to be the same"
            } else if self.firstFieldPassword.count < 8 || self.secondFieldPassword.count < 8 {
                errorMessage = "The password must have more than 8 characters"
            } else if !self.email.contains("@") && !self.email.contains(".") {
                errorMessage = "The email is not valid"
            }

            if !errorMessage.isEmpty {
                // Set the error message and alert status on the main thread
                DispatchQueue.main.async {
                    self.error = errorMessage
                    self.alert = true
                }
            } else {
                Auth.auth().createUser(withEmail: email, password: firstFieldPassword) { (response, err) in
                    if err != nil {
                        // Set the error message and alert status on the main thread
                        DispatchQueue.main.async {
                            let errorMessage = err!.localizedDescription.description
                            self.error = errorMessage
                            self.alert = true
                        }
                    } else {
                        print("Register successful")
                        // Set the sign-in state through the SwiftUI view update
                        DispatchQueue.main.async {
                            self.error = ""
                            self.alert = false
                            self.signInState = true
                        }
                    }
                }
            }
        }
    
    public func onNewCredential(validateFirstPassword: String, validateSecondPassword: String , validateEmail: String){
        firstFieldPassword = validateFirstPassword
        secondFieldPassword = validateSecondPassword
        email = validateEmail
    }
}
