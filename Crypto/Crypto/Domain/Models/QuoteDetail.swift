//
//  QuoteDetail.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 18/07/2023.
//

import Foundation

struct QuoteDetail: Codable {
    let price: Double
    let volume_24h: Double
    let volume_change_24h: Double
    let percent_change_1h: Double
    let percent_change_24h: Double
    let percent_change_7d: Double
    let market_cap: Double
    let market_cap_dominance: Double
    let fully_diluted_market_cap: Double
    let last_updated: String
}
