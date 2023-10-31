//
//  LoginResponse.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 31/10/2023.
//

import SwiftUI

enum LoginResponse: String{
    case emailOrPasswordInvalid = "email or password invalid"
    case logginSuccess = "Login Success"
    case signInSuccess = "Sign In Success"
    case emailAlreadyInUse = "The email is alrerady in use"
    case emailSent = "email sent"
}
