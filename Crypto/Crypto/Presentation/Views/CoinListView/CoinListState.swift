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

    func clone(withIsProgress: Bool? = nil,
               withCryptoCurrencies: [Cryptocurrency]? = nil, withHasError: Bool? = nil) -> CoinListState {
        return CoinListState(isProgress: withIsProgress ?? isProgress,
                             cryptoCurrencies: withCryptoCurrencies ?? self.cryptoCurrencies, hasError: withHasError ?? self.hasError)
    }
}
