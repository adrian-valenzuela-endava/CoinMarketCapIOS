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
    @Published var isLoggedInogIn: Bool
    @Published var password: String
    @Published var email: String
    @Published var error: String
    @Published var alert: Bool
    @Published var logInError: String
    
    init() {
        isLoggedInogIn = false
        password = ""
        email = ""
        error = ""
        alert = false
        logInError = ""
    }
    
    func verify(){
        var errorMessage = ""
        
        if self.email.isEmpty || self.password.isEmpty {
            errorMessage = "You can't have an empty field"
        } else if !self.email.contains("@") && !self.email.contains(".") {
            errorMessage = "The email is not valid"
        }
        
        if !errorMessage.isEmpty {
            // Set the error message and alert status on the main thread
            DispatchQueue.main.async {
                self.error = errorMessage
                self.alert = true
            }
        }
        
        else {
            Auth.auth().signIn(withEmail: email, password: password){ [self] (response,
                                                                              err) in
                
                if err != nil{
                    DispatchQueue.main.async {
                        let errorMessage = err!.localizedDescription.description
                        self.error = errorMessage
                        self.alert = true
                    }
                }
                
                else{
                    print("Login successfull")
                    DispatchQueue.main.async {
                        self.error = ""
                        self.alert = false
                        self.isLoggedInogIn = true
                    }
                }
            }
        }
    }
    
    func sendPasswordResetEmail(for email: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            completion(error)
            self.error = error!.localizedDescription.description
            self.alert = true
        }
    }
    
    func formatDate(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateStyle = .medium
            return dateFormatter.string(from: date)
        }
        return dateString
    }
    
    public func onNewCredential(validatePassword: String, validateEmail: String){
        password = validatePassword
        email = validateEmail
    }
}
