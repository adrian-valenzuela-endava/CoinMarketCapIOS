//
//  ForgotPasswordState.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 11/09/2023.
//

import Foundation

struct ForgotPasswordState{
    var email: String
    var status: Bool
    var error: String
    var message: String
    var alert: Bool
    var forgotPasswordState: Bool
    
    init(email: String?, status: Bool?, error: String?, message: String?, alert: Bool?, forgotPasswordState: Bool?) {
        self.email = email ?? ""
        self.status = status ?? false
        self.error = error ?? ""
        self.message = message ?? ""
        self.alert = alert ?? false
        self.forgotPasswordState = forgotPasswordState ?? false
    }
    
    func clone( withEmail: String? = "", withStatus: Bool = false, withError: String? = "", withMessage: String? = "", withAlert: Bool? = false, withForgotPasswordState: Bool? = false   )-> ForgotPasswordState{
        return ForgotPasswordState( email: withEmail ?? self.email, status: withStatus , error: withError ?? self.error, message: withMessage ?? self.message ,alert: withAlert ?? self.alert, forgotPasswordState: withForgotPasswordState ?? self.forgotPasswordState)
        
    }
}
