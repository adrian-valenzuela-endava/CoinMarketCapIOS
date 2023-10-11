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

    func clone(withIsProgress: Bool? = nil,
               withCryptoCurrencies: [Cryptocurrency]? = nil) -> CoinListState {
        return CoinListState(isProgress: withIsProgress ?? isProgress,
                             cryptoCurrencies: withCryptoCurrencies ?? self.cryptoCurrencies)
    }
}
