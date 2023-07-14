//
//  LogInViewModel.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 14/06/2023.
//

import Foundation
import SwiftUI
import Firebase

class LogInViewModel: ObservableObject{
    @EnvironmentObject var appState: AppState
    @Published var password: String
    @Published var email: String
    @Published var error: String
    @Published var alert: Bool
    @Published var logInError: String
    
    init() {
        password = ""
        email = ""
        error = ""
        alert = false
        logInError = ""
    }
    
    func verify(){
        if self.email.isEmpty || self.password.isEmpty {
            self.alert = true
            self.error = "You can´t have an empty field"
        }
        else if !self.email.contains("@") {
            error = "The email is not valid"
            alert = true
        }
        else {
            Auth.auth().signIn(withEmail: email, password: password){ (response,
                                                                       err) in
                
                if err != nil{
                    let errorMessage = err!.localizedDescription.description
                    self.error = errorMessage
                    self.alert = true
                }
                
                else{
                    print("Login successfull")
                    self.appState.isLoggedIn = true
                }
                
            }
        }
    }
    
    public func onNewCredential(validatePassword: String, validateEmail: String){
        password = validatePassword
        email = validateEmail
    }
}
