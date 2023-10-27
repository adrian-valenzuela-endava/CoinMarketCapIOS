//
//  SignInViewModel.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 04/07/2023.
//

import Foundation
import SwiftUI
import Firebase
import Combine

class SignInViewModel: ObservableObject{
    @Published var state: SignInState
    
    private let authUseCase : AuthUseCase
    private var cancellables = Set<AnyCancellable>()
    
    static let initialState = SignInState(firstFieldPassword: "", secondFieldPassword: "", email: "", status: false , error: "", message: "", alert: false, signInState: false)
    
    init(authUseCase: AuthUseCase , initialState: SignInState = SignInViewModel.initialState ){
        self.authUseCase = authUseCase
        state = initialState
    }
    
    func verifySignIn(email: String, firstFieldPassword: String, secondFieldPassword: String) {
        state.email = email
        state.firstFieldPassword = firstFieldPassword
        
        authUseCase.signIn(email: self.state.email, password: self.state.firstFieldPassword)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.state = (self.state.clone( withMessage: "The email is alrerady in use", withAlert: true))
                    }
                }
            }, receiveValue: { [weak self] success in
                if success {
                    DispatchQueue.main.async {
                        self?.state = (self?.state.clone( withMessage: "Sign In Success", withAlert: true))!
                    }
                }
            })
            .store(in: &cancellables)
    }
}
