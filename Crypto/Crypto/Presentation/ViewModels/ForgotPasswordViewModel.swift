//
//  ForgotPasswordViewModel.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 03/08/2023.
//

import Foundation
import Firebase

class ForgotPasswordViewModel: ObservableObject{
    @Published var alert: Bool
    @Published var email: String
    @Published var alertMessage: String
    
    init() {
        self.alert = false
        self.email = ""
        self.alertMessage = ""
    }
    
    func verify(){
        var message = ""
        
        if self.email.isEmpty {
            message = "You can't have an empty field"
        } else if !self.email.contains("@") && !self.email.contains(".") {
            message = "The email is not valid"
        }
        
        if !message.isEmpty {
            // Set the error message and alert status on the main thread
            DispatchQueue.main.async {
                self.alertMessage = message
                self.alert = true
            }
        }
        
        else {
            sendPasswordResetEmail(for: self.email){ error in
                if let error = error {
                    self.alertMessage = error.localizedDescription.description
                    self.alert = true
                }
                else{
                    DispatchQueue.main.async {
                        self.alertMessage = "Email sent"
                        self.alert = true
                    }
                }
            }
        }
    }
    
    func sendPasswordResetEmail(for email: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            completion(error)
        }
    }
}
