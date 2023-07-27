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
    @StateObject var appState: AppState = AppState(isLoggedIn: Bool())

    init(){
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            
            ContentView()
                .environmentObject(appState)
        }
    }
}
