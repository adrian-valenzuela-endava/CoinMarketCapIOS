//
//  NavigationManager.swift
//  Crypto
//
//  Created by Cristian Torrado on 19/10/2023.
//
import Combine
import Foundation


class NavigationManager: ObservableObject {

    @Published var state: NavigationState
    private var authUseCase: AuthUseCase
    private var cancellables = Set<AnyCancellable>()
    static internal var initialState: NavigationState = .splash
    static internal var instance: NavigationManager?

    static public func shared() -> NavigationManager {
        if self.instance == nil{
            self.instance = NavigationManager()
        }
        return self.instance!
    }

    private init(initialState: NavigationState = NavigationManager.initialState,
         authUseCase: AuthUseCase = DefaultAuthUseCase()){
        self.state = initialState
        self.authUseCase = authUseCase
    }

    func onAppInit(){
        authUseCase.hasUserSession()
            .sink(receiveCompletion: {  completion in
                switch completion {
                case .finished:
                    break
                case .failure:
                    self.state = .login
                }
            }, receiveValue: {  hasSession in
                if hasSession {
                    self.state = .main
                }else {
                    self.state = .login
                }
            })
            .store(in: &cancellables)
    }

    func onSessionLose(){
        state = .login
    }

    func onNewSession(){
        state = .main
    }



}
