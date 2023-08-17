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
    @Published var state: LoginState
    
    static let initialState = LoginState(isLoggedIn: false, password: "", email: "", error: "", message: "", alert: false, logInError: "")
    
    init(initialState: LoginState = LogInViewModel.initialState ){
        state = initialState
    }
    
    func verifyLogin(email:String, password: String){
        state.email = email
        state.password = password

        Auth.auth().signIn(withEmail: state.email, password: state.password){ [self] (response,
                                                                                      err) in
            
            if err != nil{
                DispatchQueue.main.async {
                    self.state.error = err!.localizedDescription.description
                    self.state.message = self.state.error
                    self.state.alert = true
                }
            }
            
            else{
                DispatchQueue.main.async {
                    self.state.message = "Login successfull"
                    self.state.alert = true
                    self.state = self.state.clone(withIsLoggedIn: true,withError: "", withAlert: false)
                }
            }
        }
        
    }
    
    func sendPasswordResetEmail(for email: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            completion(error)
            self.state = self.state.clone(withError: error!.localizedDescription.description, withAlert: true)
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
    
}
