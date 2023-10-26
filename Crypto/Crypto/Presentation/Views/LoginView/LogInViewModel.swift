//
//  LogInViewModel.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 14/06/2023.
//

import Foundation
import SwiftUI
import Firebase
import Combine

class LogInViewModel: ObservableObject{
    @Published var state: LoginState
    
    private let authUseCase : AuthUseCase
    private var cancellables = Set<AnyCancellable>()
    
    static let initialState = LoginState(isLoggedIn: false, password: "", email: "", error: "", message: "", alert: false, logInError: "")
    
    init(authUseCase: AuthUseCase = DefaultAuthUseCase(), initialState: LoginState = LogInViewModel.initialState ){
        self.authUseCase = authUseCase
        state = initialState
    }
    
    func verifyLogin(email: String, password: String) {
        state.email = email
        state.password = password
        
        authUseCase.logIn(email: self.state.email, password: self.state.password)
                    .sink(receiveCompletion: { [weak self] completion in
                        switch completion {
                        case .finished:
                            break
                        case .failure(let error):
                            DispatchQueue.main.async {
                                self?.state = (self?.state.clone(withIsLoggedIn: false,withMessage: "email or password invalid", withAlert: true))!
                            }
                        }
                    }, receiveValue: { [weak self] success in
                        if success {
                            DispatchQueue.main.async {
                                self?.state = (self?.state.clone(withIsLoggedIn: true, withMessage: "Login Success", withAlert: true))!
                            }
                        }
                    })
                    .store(in: &cancellables)
    }
    
    
    func sendPasswordResetEmail(for email: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            completion(error)
            self.state = self.state.clone(withError: error!.localizedDescription.description, withAlert: true)
        }
    }
    
    func formatDate(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateStyle = .medium
            return dateFormatter.string(from: date)
        }
        return dateString
    }
    
}
