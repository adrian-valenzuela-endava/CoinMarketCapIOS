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
                                            cryptoCurrencies: [],hasError: false)
    
    private let coinFetchUseCase : CoinFetchUseCase
    private var cancellables: Set<AnyCancellable> = []
    
    init(initialState: CoinListState = defaultState, coinFetchUseCase: CoinFetchUseCase){
        self.state = initialState
        self.coinFetchUseCase = coinFetchUseCase
    }
    
    func fetchCryptocurrencyData() {
        state = state.clone(withIsProgress: true)
        coinFetchUseCase.getCryptoCurrencies()
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
    
}
