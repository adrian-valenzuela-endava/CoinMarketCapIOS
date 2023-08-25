//
//  AuthRepository.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 16/08/2023.
//

import Foundation
import Combine

protocol AuthRepository{
    func signIn(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void)
    
    func logIn(email: String, password: String) -> AnyPublisher<Bool, Error>
    
    func resetPassword(email: String, completion: @escaping (Result<Bool, Error>) -> Void)
}
