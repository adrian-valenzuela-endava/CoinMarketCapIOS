//
//  CryptoApp.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 24/05/2023.
//

import SwiftUI

@main
struct CryptoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(contentViewData: ContentViewModel(), singleViewData: SingleCoinViewModel())
        }
    }
}
