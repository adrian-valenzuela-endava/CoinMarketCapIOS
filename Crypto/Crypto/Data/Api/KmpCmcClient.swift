//
//  KmpCmcClient.swift
//  Crypto
//
//  Created by Adrian Jose Valenzuela on 25/03/2024.
//

import Foundation
import CmcApi

class KmpCmcClient {
    
    static let shared = KmpCmcClient()
    
    public let config = CmcClientConfig(
        token: "3b94c36c-e5a0-4adb-9593-5b4e00c693c9",
        baseUrl: "https://pro-api.coinmarketcap.com/"
    )
    
    private let client: CmcClient
    public let cryptoCurrencyService: CryptoCurrencyService
    
    private init() {
        self.client = CmcClientFactoryKt.create(config: config)
        self.cryptoCurrencyService = client.cryptoCurrencyService
    }
    
    func setAuthToken(_ token: String) {
        self.config.token = token
    }
    
}
