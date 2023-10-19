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
    @StateObject var mainViewModel = MainViewModel(authUseCase: DefaultAuthUseCase(authRepository: FirebaseAuth(firebaseAuth: Auth.auth())))
    @StateObject var loginViewModel = LogInViewModel(authUseCase: DefaultAuthUseCase(authRepository: FirebaseAuth(firebaseAuth: Auth.auth())))
    @State var loginApprobed = false
    @State var logOutApprobed = false
    
    init(){
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            
            if loginViewModel.state.isLoggedIn && !mainViewModel.state.isLogout{
                MainView()
                    .environmentObject(mainViewModel)
            }
            else{
                LogInView()
                    .environmentObject(loginViewModel)
            }
        }
    }
}
