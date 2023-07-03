//
//  LogInViewModel.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 14/06/2023.
//

import Foundation
import SwiftUI

class LogInViewModel: ObservableObject{
    @ObservedObject var errorViewModel = ErrorViewModel()
    @Published var password: String
    @Published var email: String
    
    init() {
        password = ""
        email = ""
    }
    
    func verify(){
        if self.email.isEmpty || self.password.isEmpty{
            errorViewModel.toggleError()
        }
        else {
            print("error")
        }
    }
    
    public func onNewCredential(validatePassword: String, validateEmail: String){
        password = validatePassword
        email = validateEmail
        
    }
}
