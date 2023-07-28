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
    @StateObject var contentViewModel = CoinListViewModel()
    @StateObject var loginViewModel = LogInViewModel()

    init(){
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            
            if loginViewModel.isLoggedInogIn{
                ContentView()
                    .environmentObject(contentViewModel)
            }else {
                LogInView()
                    .environmentObject(loginViewModel)
            }
        }
    }
}
