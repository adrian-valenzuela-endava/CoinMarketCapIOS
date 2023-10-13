//
//  CoinRepository.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 19/09/2023.
//

import Foundation
import Combine

protocol CoinRepository{
    func fetchAllCoinsData() -> AnyPublisher<[Cryptocurrency], CryptoErrors>
}

class CoinMarketApiFetch: CoinRepository{
    
    private var coinApi: CoinMarketCapApiProtocol
    
    //private var coins: [Cryptocurrency]
    
    init(coinApi: CoinMarketCapApiProtocol){
        self.coinApi = coinApi
    }
    
    func fetchAllCoinsData() -> AnyPublisher<[Cryptocurrency], CryptoErrors> {
        return Future<[Cryptocurrency], CryptoErrors> { promise in
            self.coinApi.fetchCryptocurrencyData() { (response, err) in
                guard let response = response, err == nil else {
                    promise(.failure(.newUserError))
                    return
                }
                promise(.success(response))
            }
        }
        .eraseToAnyPublisher()
    }

}
