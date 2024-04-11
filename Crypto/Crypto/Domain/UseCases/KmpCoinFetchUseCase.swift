//
//  KmpcoinFetchUseCase.swift
//  Crypto
//
//  Created by Adrian Jose Valenzuela on 25/03/2024.
//

import Foundation
import Combine
import CmcApi

class KmpCoinFetchUseCase {
    
    private let coinRepository = KmpCoinRepository()
    
    private let defaultListingLatestQuery = ListingLatestQuery(start: 1,limit: 10, convert: "USD")
    
    func execute() -> AnyPublisher<[CryptoCurrencyUi], CryptoErrors> {
        return coinRepository.fetchListingLatest(query: defaultListingLatestQuery).map{ result in
            return result.map { CryptoCurrency in
                CryptoCurrencyUiConverter().convert(source: CryptoCurrency)
            }
        }.mapError{err in
            return err
        }
        .eraseToAnyPublisher()
    }
    
}
