//
//  CryptoApp.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 24/05/2023.
//

import SwiftUI
import FirebaseCore


@main
struct YourApp: App {
    @StateObject var mainViewModel = MainViewModel()
    @StateObject var loginViewModel = LogInViewModel()

    init(){
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            
            if loginViewModel.isLoggedInogIn{
                MainView()
                    .environmentObject(mainViewModel)
            }else {
                LogInView()
                    .environmentObject(loginViewModel)
            }
        }
    }
}
