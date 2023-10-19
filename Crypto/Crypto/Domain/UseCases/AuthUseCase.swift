//
//  AuthUseCase.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 16/08/2023.
//

import Foundation
import Combine

protocol AuthUseCase {
    func signIn(email: String, password: String) -> AnyPublisher<Bool, CryptoErrors>
    func logIn(email: String, password: String) -> AnyPublisher<Bool, CryptoErrors>
    func resetPassword(email: String) -> AnyPublisher<Bool, CryptoErrors>
    func logOut() -> AnyPublisher<Bool, CryptoErrors>
    func hasUserSession() -> AnyPublisher<Bool, CryptoErrors>
}

class DefaultAuthUseCase: AuthUseCase {
        
    private let authRepository: AuthRepository
    
    init(authRepository: AuthRepository = FirebaseAuth()) {
        self.authRepository = authRepository
    }
    
    func logOut() -> AnyPublisher<Bool, CryptoErrors> {
        return authRepository.logOut().map{result in
            return result
        }.mapError{err in
            return err
        }
        .eraseToAnyPublisher()
    }
    
    func signIn(email: String, password: String) -> AnyPublisher<Bool, CryptoErrors> {
        return authRepository.signIn(email: email, password: password).map{result in
            return result
        }.mapError{err in
            return err
        }
        .eraseToAnyPublisher()
    }
    
    func logIn(email: String, password: String) -> AnyPublisher<Bool, CryptoErrors>  {
        return authRepository.logIn(email: email, password: password).map{result in
            return result
        }.mapError{err in
            return err
        }
        .eraseToAnyPublisher()
    }
    
    func resetPassword(email: String) -> AnyPublisher<Bool, CryptoErrors> {
        return authRepository.resetPassword(email: email).map{result in
            return result
        }.mapError{err in
            return err
        }
        .eraseToAnyPublisher()
    }

    func hasUserSession() -> AnyPublisher<Bool, CryptoErrors>{
        authRepository.hasUserSession()
        .map{result in
            return result
        }.mapError{err in
            return err
        }
        .eraseToAnyPublisher()
    }

    
}
