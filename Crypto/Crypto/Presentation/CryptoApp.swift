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
    // TODO : Refactor like the LoginViewModel dependency injection
    @StateObject var mainViewModel = MainViewModel(authUseCase: DefaultAuthUseCase(authRepository: FirebaseAuth(firebaseAuth: Auth.auth())))
    @StateObject var navigationManger = NavigationManager.shared()
    @State var loginApprobed = false
    @State var logOutApprobed = false
    
    init(){
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ZStack{
                switch navigationManger.state{
                case .login:
                    LogInView()
                case .main:
                    MainView()
                        .environmentObject(mainViewModel)
                case .splash:
                    SplashScreenView()
                }
            }.onAppear{
                navigationManger.onAppInit()
            }
        }
    }
}
