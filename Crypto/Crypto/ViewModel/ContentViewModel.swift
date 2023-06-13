//
//  ContentViewModel.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 08/06/2023.
//
import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
    
    @Published var total: String
    @Published var rates: [Coin]
    @Published var myWallet: [Coin]
    
    init() {
        total = ""
        rates = []
        myWallet = []
    }
    public func chargeAllContentViewData() -> Void{
        getAllReceivedRates()
        getMyWalletRates()
        getTotalBalance(myWallet: myWallet)
    }
    
    private func getTotalBalance (myWallet: [Coin]) -> Void{
        var totalCount: Float = 0
        for coin in myWallet{
            totalCount += coin.price
        }
        total = String(totalCount)
        
    }
    
    private func getMyWalletRates() -> Void{
        myWallet = [
            Coin( name: "Bitcoin", price: 1000.0,icon: "bitcoin",date: formatter(date: "10/10/2023")),
            Coin( name: "Litecoin", price: 2000.0,icon: "Litecoin",date: formatter(date: "09/10/2023")),
            Coin( name: "Tron", price: 133.7,icon: "tron",date: formatter(date: "12/10/2023"))
        ]
    }
    
    
     func getAllReceivedRates() -> Void {
        rates = [
            Coin( name: "Bitcoin", price: 9733.95,icon: "bitcoin",date: formatter(date: "10/10/2023")),
            Coin( name: "Litecoin", price: 78.70,icon: "Litecoin",date: formatter(date: "09/10/2023")),
            Coin( name: "Ripple", price: 0.30,icon: "ripple",date: formatter(date: "08/10/2023")),
            Coin( name: "Tron", price: 0.02,icon: "tron",date: formatter(date: "12/10/2023")),
            Coin( name: "Ethereum", price: 200.45,icon: "ethereum",date: formatter(date: "13/10/2023")),
            
        ]
    }
}

