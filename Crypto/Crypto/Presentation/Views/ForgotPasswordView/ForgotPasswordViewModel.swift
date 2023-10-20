//
//  ForgotPasswordViewModel.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 03/08/2023.
//

import Foundation
import Firebase
import Combine

class ForgotPasswordViewModel: ObservableObject{
    @Published var state: ForgotPasswordState
    
    private let authUseCase : AuthUseCase
    private var cancellables = Set<AnyCancellable>()
    
    static let initialState = ForgotPasswordState(email: "", status: false, error: "", message: "", alert: false, forgotPasswordState: false)
    
    init(authUseCase: AuthUseCase , initialState: ForgotPasswordState = ForgotPasswordViewModel.initialState ){
        self.authUseCase = authUseCase
        state = initialState
    }
    
    func restorePassword(email: String){
        state.email = email
        
        authUseCase.resetPassword(email: self.state.email)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    DispatchQueue.main.async {
                        self?.state = (self?.state.clone( withError: error.localizedDescription, withAlert: true))!
                    }
                }
            }, receiveValue: { [weak self] success in
                if success {
                    DispatchQueue.main.async {
                        self?.state = (self?.state.clone(withMessage: "Email sent", withAlert: true))!
                    }
                }
            })
            .store(in: &cancellables)
    }
    
}
