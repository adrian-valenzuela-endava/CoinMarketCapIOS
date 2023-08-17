//
//  AuthUseCase.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 16/08/2023.
//

import Foundation

protocol AuthUseCase {
    func signIn(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void)
    func logIn(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void)
    func resetPassword(email: String, completion: @escaping (Result<Bool, Error>) -> Void)
}

class DefaultAuthUseCase: AuthUseCase {
    private let authRepository: AuthRepository
    
    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    func signIn(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        authRepository.signIn(email: email, password: password) { result in

        }
    }
    
    func logIn(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        authRepository.logIn(email: email, password: password) { result in

        }
    }
    
    func resetPassword(email: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        authRepository.resetPassword(email: email) { result in

        }
    }
}
