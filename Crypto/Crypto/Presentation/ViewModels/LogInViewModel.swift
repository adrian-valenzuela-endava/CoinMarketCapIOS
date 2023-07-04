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
    @ObservedObject var errorViewModel = ErrorViewModel()
    @ObservedObject var mainViewModel = MainViewModel(state: MainViewModelState.initialMainView)
    @Published var password: String
    @Published var email: String
    @Published var status: Bool
    @State var logInError: String
    
    init() {
        password = ""
        email = ""
        status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
        logInError = ""
    }
    
    func verify(){
        if self.email.isEmpty || self.password.isEmpty {
            errorViewModel.toggleError()
        }
        else {
            Auth.auth().signIn(withEmail: email, password: password){ (response,
                                                                       err) in
                
                if err != nil{
                    self.logInError = err!.localizedDescription
                    self.errorViewModel.setMessageError(newMessageError: self.logInError)
                }
                
                if self.status{
                    print("Login successfull")
                    self.mainViewModel.logInApprobed()
                }
                
            }
        }
    }
    
    public func onNewCredential(validatePassword: String, validateEmail: String){
        password = validatePassword
        email = validateEmail
    }
}
