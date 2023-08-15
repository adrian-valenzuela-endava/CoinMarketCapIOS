//
//  File.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 08/08/2023.
//

import Foundation


struct LoginState {
    
    var isLoggedIn: Bool
    var password: String
    var email: String
    var error: String
    var message: String
    var alert: Bool
    var logInError: String
    
    
    init(isLoggedIn: Bool?, password: String?, email: String?, error: String?, message: String?, alert: Bool?, logInError: String?) {
        self.isLoggedIn = isLoggedIn ?? false
        self.password = password ?? ""
        self.email = email ?? ""
        self.error = error ?? ""
        self.message = message ?? ""
        self.alert = alert ?? false
        self.logInError = logInError ?? ""
    }
    
    func clone(withIsLoggedIn: Bool? = nil, withPassword: String? = "", withEmail: String? = "", withError: String? = "", withMessage: String? = "", withAlert: Bool? = false, withLogInError: String? = ""   )-> LoginState{
        return LoginState(isLoggedIn: withIsLoggedIn ?? self.isLoggedIn, password: withPassword ?? self.password, email: withEmail ?? self.email, error: withError ?? self.error, message: withMessage ?? self.message,alert: withAlert ?? self.alert, logInError: withLogInError ?? self.logInError)
        
    }
}
