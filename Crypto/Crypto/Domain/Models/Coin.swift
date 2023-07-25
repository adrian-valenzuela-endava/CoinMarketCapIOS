//
//  Coin.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 10/06/2023.
//

import Foundation

struct Coin: Codable {
    let id: Int
    let name: String
    let symbol: String
    let slug: String
    let cmcRank: Int
    let numMarketPairs: Int
    let circulatingSupply: Double
    let totalSupply: Double
    let maxSupply: Double?
    let infiniteSupply: Bool
    let lastUpdated: String
    let dateAdded: String
    let tags: [String]
    let platform: Platform?
    let selfReportedCirculatingSupply: Double?
    let selfReportedMarketCap: Double?
    let quote: Quote
}
