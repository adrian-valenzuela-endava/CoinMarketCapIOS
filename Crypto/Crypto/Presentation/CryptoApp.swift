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

    init(){
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            MainView(mainViewModel: MainViewModel())
        }
    }
}
