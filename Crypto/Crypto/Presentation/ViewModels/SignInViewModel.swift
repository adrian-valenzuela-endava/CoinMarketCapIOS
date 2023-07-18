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
    
    func verify(){
        if self.email.isEmpty || self.firstFieldPassword.isEmpty || self.secondFieldPassword.isEmpty {
            error = "You can´t send an empty field"
            alert = true
        }
        else if self.firstFieldPassword != self.secondFieldPassword {
            error = "The passwords have to be the same"
            alert = true
        }
        else if self.firstFieldPassword.count < 8 || self.secondFieldPassword.count < 8 {
            error = "The password must have more than 8 characters"
            alert = true
        }
        else if !self.email.contains("@") {
            error = "The email is not valid"
            alert = true
        }
        
        else {
            Auth.auth().createUser(withEmail: email, password: firstFieldPassword){ (response,
                                                                       err) in
                if err != nil{
                    let errorMessage = err!.localizedDescription.description
                    self.error = errorMessage
                    self.alert = true
                }
                
                else{
                    print("register successfull")
                    self.signInState = true
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
