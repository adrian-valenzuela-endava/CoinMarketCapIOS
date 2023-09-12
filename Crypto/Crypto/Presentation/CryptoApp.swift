//
//  CryptoApp.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 24/05/2023.
//

import SwiftUI
import FirebaseCore
import Firebase


@main
struct YourApp: App {
    @StateObject var mainViewModel = MainViewModel()
    @StateObject var loginViewModel = LogInViewModel(authUseCase: DefaultAuthUseCase(authRepository: FirebaseAuth(firebaseAuth: Auth.auth())))

    init(){
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            
            if loginViewModel.state.isLoggedIn{
                MainView()
                    .environmentObject(mainViewModel)
            }else {
                LogInView()
                    .environmentObject(loginViewModel)
            }
        }
    }
}
