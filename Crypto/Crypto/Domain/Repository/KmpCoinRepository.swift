//
//  KmpCoinRepository.swift
//  Crypto
//
//  Created by Adrian Jose Valenzuela on 25/03/2024.
//

import Foundation
import Combine
import CmcApi
import OSLog


typealias CryptoCurrencyUi = Cryptocurrency
typealias CryptoCurrencyDto = CryptoCurrency

typealias QuoteDto = Quote

class KmpCoinRepository {
    
    private let cryptoCurrencyService = KmpCmcClient.shared.cryptoCurrencyService
    
    func fetchListingLatest(query: ListingLatestQuery) -> AnyPublisher<[CryptoCurrencyDto], CryptoErrors> {
        let defaultLog = Logger();
        return Future<[CryptoCurrencyDto], CryptoErrors> { promise in
            defaultLog.debug("KmpCoinRepository: executing fetchListingLatest");
            self.cryptoCurrencyService.getListingLatest(query: query) { (cmcResponse, err) in
                guard let cmcResponse = cmcResponse, err == nil, cmcResponse.data != nil else {
                    defaultLog.debug("KmpCoinRepository: failed at fetchListingLatest");
                    promise(.failure(.newUserError))
                    return
                }
                defaultLog.debug("KmpCoinRepository: success at fetchListingLatest");
                promise(.success(cmcResponse.data as! [CryptoCurrencyDto]))
            }
        }
        .eraseToAnyPublisher()
    }
}
