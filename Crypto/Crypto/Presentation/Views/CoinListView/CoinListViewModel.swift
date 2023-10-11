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
                                            cryptoCurrencies: [])
    
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
                    break
                    // TODO: IMPLEMENT ERROR HANDLING ALSO USING STATE (add a error: Error value to the state and update its status)
                    //self.state = self.state.clone(withIsProgress: false, withError: error)
                }
            },  receiveValue: { cryptocurrencies in
                DispatchQueue.main.async {
                    self.state = self.state.clone(withIsProgress: false, withCryptoCurrencies: cryptocurrencies)
                }
            })
            .store(in: &cancellables)
    }
    
}
