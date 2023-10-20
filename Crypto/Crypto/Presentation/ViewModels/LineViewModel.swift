//
//  LineViewModel.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 18/07/2023.
//

import Foundation

class LineViewModel: ObservableObject{
    @Published var coinAmount: [Amount]
    
    init() {
        coinAmount = []
    }
    
    func chargeCoinAmount(coin: [Amount]){
        self.coinAmount = coin
    }
}
