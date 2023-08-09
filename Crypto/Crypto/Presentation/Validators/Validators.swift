//
//  Validators.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 08/08/2023.
//

import Foundation


struct Validators {
    
    static func validateUsername(username: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: username)
    }
    
    static func validatePassWord(password: String) -> Bool{
        if password.count == 0 {
            return false
        }else if  password.count < 8 {
            return false
        }
        return true
    }
    
    static func validatePassWords(firstPassword: String, secondPassword: String) -> Bool{
        if firstPassword.count == 0 || secondPassword.count == 0{
            return false
        }else if  firstPassword != secondPassword {
            return false
        }else if !validatePassWord(password: firstPassword) || !validatePassWord(password: secondPassword){
            return false
        }
        return true
    }
    
    static func validateLogInFields(username: String, password: String) -> Bool{
        if !validatePassWord(password: password) || !validateUsername(username: username){
            return false
        }
        return true
    }
}

//else if self.state.firstFieldPassword != self.state.secondFieldPassword {
//    errorMessage = errorMessage2
//} else if self.state.firstFieldPassword.count < 8 || self.state.secondFieldPassword.count < 8 {
//   errorMessage = errorMessage3
//}

