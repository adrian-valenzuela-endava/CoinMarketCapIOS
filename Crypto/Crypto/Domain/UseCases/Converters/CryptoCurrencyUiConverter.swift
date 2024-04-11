//
//  CryptoCurrencyUiConverter.swift
//  Crypto
//
//  Created by Adrian Jose Valenzuela on 25/03/2024.
//

import Foundation
import CmcApi

class CryptoCurrencyUiConverter {
    
    func convert(source: CryptoCurrencyDto) -> CryptoCurrencyUi {
        return CryptoCurrencyUi(
            id: source.id?.toInt() ?? 0,
            name: source.name ?? "",
            symbol: source.symbol ?? "",
            slug: source.slug ?? "",
            quote: QuoteUiConverter().convert(source: source.quote["USD"])
        )
    }
    
    
}
