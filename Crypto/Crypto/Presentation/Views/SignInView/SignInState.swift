//
//  SignInState.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 08/08/2023.
//

import Foundation

struct SignInState{
    
    var firstFieldPassword: String
    var secondFieldPassword: String
    var email: String
    var status: Bool
    var error: String
    var alert: Bool
    var signInState: Bool
    
    init(firstFieldPassword: String?, secondFieldPassword: String?, email: String?, status: Bool?, error: String?, alert: Bool?, signInState: Bool?) {
        self.firstFieldPassword = firstFieldPassword ?? ""
        self.secondFieldPassword = secondFieldPassword ?? ""
        self.status = status ?? false
        self.email = email ?? ""
        self.status = status ?? false
        self.error = error ?? ""
        self.alert = alert ?? false
        self.signInState = signInState ?? false
    }
    
    func clone(withFirstFieldPassword: String? = "", withSecondFieldPassword: String? = "", withEmail: String? = "", withStatus: Bool = false, withError: String? = "", withAlert: Bool? = false, withSignInState: Bool? = false   )-> SignInState{
        return SignInState(firstFieldPassword: withFirstFieldPassword ?? self.firstFieldPassword, secondFieldPassword: withSecondFieldPassword  ?? self.secondFieldPassword, email: withEmail ?? self.email, status: withStatus , error: withError ?? self.error, alert: withAlert ?? self.alert, signInState: withSignInState ?? self.signInState)
        
    }
}



