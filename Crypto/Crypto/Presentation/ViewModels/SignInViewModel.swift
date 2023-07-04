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
    @ObservedObject var errorViewModel = ErrorViewModel()
    @ObservedObject var mainViewModel = MainViewModel(state: MainViewModelState.initialMainView)
    @Published var firstFieldPassword: String
    @Published var secondFieldPassword: String
    @Published var email: String
    @Published var status: Bool
    @State var signInError: String
    
    init() {
        firstFieldPassword = ""
        secondFieldPassword = ""
        email = ""
        status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
        signInError = ""
    }
    
    func verify(){
        if self.email.isEmpty || self.firstFieldPassword.isEmpty || self.secondFieldPassword.isEmpty {
            errorViewModel.setMessageError(newMessageError: "You can´t send an empty field")
            errorViewModel.toggleError()
        }
        else if self.firstFieldPassword != self.secondFieldPassword {
            errorViewModel.setMessageError(newMessageError: "The passwords are not equeals")
            errorViewModel.toggleError()
        }
        
        else {
            Auth.auth().signIn(withEmail: email, password: firstFieldPassword){ (response,
                                                                       err) in
                
                if err != nil{
                    self.signInError = err!.localizedDescription
                    self.errorViewModel.setMessageError(newMessageError: self.signInError)
                }
                
                if self.status{
                    print("Sign in successfull")
                    self.mainViewModel.logInApprobed()
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
