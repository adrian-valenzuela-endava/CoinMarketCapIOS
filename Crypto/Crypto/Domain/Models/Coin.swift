//
//  Coin.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 10/06/2023.
//

import Foundation

struct Coin: Codable, Hashable {
    let name: String
    let price: Float
    let symbol: String
    let date : Date
}
