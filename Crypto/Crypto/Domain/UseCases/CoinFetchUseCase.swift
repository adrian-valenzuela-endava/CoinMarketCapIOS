//
//  CoinFetchAuthUseCase.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 21/09/2023.
//

import Foundation
import Combine

protocol CoinFetchUseCase {
    func getCryptoCurrencies() -> AnyPublisher<[Cryptocurrency], CryptoErrors>
}

class DefaultCoinFetchUseCase: CoinFetchUseCase {
    
    private let coinRepository: CoinRepository
    
    init(coinRepository: CoinRepository) {
        self.coinRepository = coinRepository
    }
    
    func getCryptoCurrencies() -> AnyPublisher<[Cryptocurrency], CryptoErrors> {
        return coinRepository.fetchAllCoinsData().map{result in
            return result
        }.mapError{err in
            return err
        }
        .eraseToAnyPublisher()
    }
    
}
