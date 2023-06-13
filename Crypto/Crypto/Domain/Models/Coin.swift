//
//  Coin.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 10/06/2023.
//

import Foundation

struct Coin: Hashable,Identifiable {
    let id = UUID()
    let name: String
    let price: Float
    let icon: String
    let date : Date
}
