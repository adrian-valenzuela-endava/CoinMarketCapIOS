//
//  MainviewModel.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 13/10/2023.
//

import Foundation
import Combine

class MainViewModel: ObservableObject{
    @Published var state: MainViewState
    static let defaultState = MainViewState(isLogout: false)
    private let authUseCase: AuthUseCase
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(initialState: MainViewState = defaultState,authUseCase: AuthUseCase = DefaultAuthUseCase()) {
        self.state = initialState
        self.authUseCase = authUseCase
    }
    
    func logOutUser(){
        authUseCase.logOut()
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    break
                    // TODO: IMPLEMENT ERROR HANDLING ALSO USING STATE (add a error: Error value to the state and update its status)
                    //self.state = self.state.clone(withIsProgress: false, withError: error)
                }
            },  receiveValue: { cryptocurrencies in
                DispatchQueue.main.async {
                    self.state = self.state.clone(withIsLogOut: true)
                }
            })
            .store(in: &cancellables)
    }
}
