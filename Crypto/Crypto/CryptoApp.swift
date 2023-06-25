//
//  CryptoApp.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 24/05/2023.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct CryptoApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    
    var body: some Scene {
        WindowGroup {
            //ContentView(contentViewData: ContentViewModel(), singleViewData: SingleCoinViewModel())
            LogInView(errorViewModel: ErrorViewModel(), loginViewModel: LogInViewModel())
        }
    }
}
