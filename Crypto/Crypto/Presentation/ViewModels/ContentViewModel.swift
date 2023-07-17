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
    var currency: Coin? = nil
    
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
            Coin( name: "Bitcoin", price: 1000.0,symbol: "bitcoin",date: formatter(date: "10/10/2023")),
            Coin( name: "Litecoin", price: 2000.0,symbol: "Litecoin",date: formatter(date: "09/10/2023")),
            Coin( name: "Tron", price: 133.7,symbol: "tron",date: formatter(date: "12/10/2023"))
        ]
    }
    
    
     func getAllReceivedRates() -> Void {
        rates = [
            Coin( name: "Bitcoin", price: 9733.95,symbol: "bitcoin",date: formatter(date: "10/10/2023")),
            Coin( name: "Litecoin", price: 78.70,symbol: "Litecoin",date: formatter(date: "09/10/2023")),
            Coin( name: "Ripple", price: 0.30,symbol: "ripple",date: formatter(date: "08/10/2023")),
            Coin( name: "Tron", price: 0.02,symbol: "tron",date: formatter(date: "12/10/2023")),
            Coin( name: "Ethereum", price: 200.45,symbol: "ethereum",date: formatter(date: "13/10/2023")),
            
        ]
    }
    
    func fetchData() {
        guard let url = URL(string: "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=3b94c36c-e5a0-4adb-9593-5b4e00c693c9") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("Data is nil")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let coinResponse = try decoder.decode(CoinResponse.self, from: data)
                
    
                DispatchQueue.main.async {
                    self.rates = coinResponse.data
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }.resume()
    }
}

