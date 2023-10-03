//
//  TestViewModel.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 17/07/2023.
//

import Foundation
import SwiftUI
import Combine

class CoinListViewModel: ObservableObject{
    @Published var cryptocurrencies: [Cryptocurrency] = []
    
    private let coinFetchUseCase : CoinFetchUseCase
    private var cancellables = Set<AnyCancellable>()
    
    init(coinFetchUseCase: CoinFetchUseCase){
        self.coinFetchUseCase = coinFetchUseCase
    }
    
    func fetchCryptocurrencyData() {
        coinFetchUseCase.getCryptoCurrencies()
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    DispatchQueue.main.async {
                        
                    }
                }
            },  receiveValue: { [weak self] cryptocurrencies in
                DispatchQueue.main.async {
                    self?.cryptocurrencies = cryptocurrencies
                }
            })
            .store(in: &cancellables)
    }
    
}
