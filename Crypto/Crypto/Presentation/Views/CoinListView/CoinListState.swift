//
//  CoinListState.swift
//  Crypto
//
//  Created by Axel Mosiejko on 11/10/2023.
//

import Foundation

struct CoinListState {
    let isProgress: Bool
    let cryptoCurrencies: [Cryptocurrency]
    let hasError: Bool
    let cryptoCurrencySelected: Cryptocurrency?
    let shouldToNavigateToCoinScreen: Bool

    func clone(withIsProgress: Bool? = nil,
               withCryptoCurrencies: [Cryptocurrency]? = nil, withHasError: Bool? = nil, withcryptoCurrencySelected: Cryptocurrency? = nil, withShouldToNavigateToCoinScreen: Bool? = nil)  -> CoinListState {
        return CoinListState(isProgress: withIsProgress ?? isProgress,
                             cryptoCurrencies: withCryptoCurrencies ?? self.cryptoCurrencies, hasError: withHasError ?? self.hasError,
                             cryptoCurrencySelected: withcryptoCurrencySelected,
                             shouldToNavigateToCoinScreen: withShouldToNavigateToCoinScreen ?? shouldToNavigateToCoinScreen
        )
    }
}
