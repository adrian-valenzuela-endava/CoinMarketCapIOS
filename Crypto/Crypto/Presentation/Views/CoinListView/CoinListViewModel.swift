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
    @Published var state: CoinListState
    static let defaultState = CoinListState(isProgress: false,
                                            cryptoCurrencies: [],
                                            hasError: false, cryptoCurrencySelected: nil, shouldToNavigateToCoinScreen: false)
    
    private let coinFetchUseCase : CoinFetchUseCase
    private let kmpCoinFetchUseCase : KmpCoinFetchUseCase
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(initialState: CoinListState = defaultState, coinFetchUseCase: CoinFetchUseCase){
        self.state = initialState
        self.coinFetchUseCase = coinFetchUseCase
        self.kmpCoinFetchUseCase = KmpCoinFetchUseCase()
    }
    
    func fetchCryptocurrencyData() {
        state = state.clone(withIsProgress: true)
        kmpCoinFetchUseCase.execute()
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    DispatchQueue.main.async {
                        self?.state = (self?.state.clone(withHasError: true))!
                    }
                }
            },  receiveValue: { cryptocurrencies in
                DispatchQueue.main.async {
                    self.state = self.state.clone(withIsProgress: false, withCryptoCurrencies: cryptocurrencies, withHasError: false)
                }
            })
            .store(in: &cancellables)
    }
    
    func onCoinSelected(cryptocurrency: Cryptocurrency){
        state = state.clone(withcryptoCurrencySelected: cryptocurrency, withShouldToNavigateToCoinScreen: true)
    }
    
    func onReturnFromCryptocurrencyDetailPage(){
        state = state.clone(withcryptoCurrencySelected: nil, withShouldToNavigateToCoinScreen: false)
    }
    
}
