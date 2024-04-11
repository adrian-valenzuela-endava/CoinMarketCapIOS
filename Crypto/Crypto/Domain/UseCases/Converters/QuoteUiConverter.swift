//
//  QuoteUiConverter.swift
//  Crypto
//
//  Created by Adrian Jose Valenzuela on 25/03/2024.
//

import Foundation
import CmcApi


class QuoteUiConverter {
    
    func convert(source: QuoteDto?) -> QuoteUi {
        guard let source = source else {
            let defaultQuoteDetail = QuoteDetail(
                price: 0.0,
                volume_24h: 0.0,
                volume_change_24h: 0.0,
                percent_change_1h: 0.0,
                percent_change_24h: 0.0,
                percent_change_7d: 0.0,
                market_cap: 0.0,
                market_cap_dominance: 0.0,
                fully_diluted_market_cap: 0.0,
                last_updated: ""
            )
            return QuoteUi(USD: defaultQuoteDetail)
        }
        return QuoteUi(USD: QuoteDetail(
            price: source.price?.toDouble() ?? 0.0,
            volume_24h: source.volume24h?.toDouble()  ?? 0.0,
            volume_change_24h: source.volumeChange24h?.toDouble() ?? 0.0,
            percent_change_1h: source.percentChange1h?.toDouble() ?? 0.0,
            percent_change_24h: source.percentChange24h?.toDouble() ?? 0.0,
            percent_change_7d: source.percentChange7d?.toDouble() ?? 0.0,
            market_cap: source.marketCap?.toDouble() ?? 0.0,
            market_cap_dominance: source.marketCapDominance?.toDouble() ?? 0.0,
            fully_diluted_market_cap: source.fullyDilutedMarketCap?.toDouble() ?? 0.0,
            last_updated: source.lastUpdated ?? ""
        ))
    }
    
}
