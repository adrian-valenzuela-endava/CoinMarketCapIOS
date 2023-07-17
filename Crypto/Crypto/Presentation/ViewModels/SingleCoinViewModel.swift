//
//  LineViewModel.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 12/06/2023.
//

import Foundation

class SingleCoinViewModel: ObservableObject{
    
    @Published var coinValues: [Coin]
    @Published var coinPerDay: [Date:Float]
    @Published var amountPerDay: [Amount]
    
    init() {
        coinValues = []
        coinPerDay = [:]
        amountPerDay = []
    }
    
    var singleCoinValues: [Coin] = [
        Coin( name: "Bitcoin", price: 6000.95,symbol: "bitcoin",date: formatter(date: "10/10/2023")),
        Coin( name: "Bitcoin", price: 9800.0,symbol: "bitcoin",date: formatter(date: "11/10/2023")),
        Coin( name: "Bitcoin", price: 8500.0,symbol: "bitcoin",date: formatter(date: "12/10/2023")),
        Coin( name: "Bitcoin", price: 7000.0,symbol: "bitcoin",date: formatter(date: "13/10/2023")),
        Coin( name: "Bitcoin", price: 10000.0,symbol: "bitcoin",date: formatter(date: "14/10/2023")),
        
    ]

    var myWallet: [Coin] = [
        Coin( name: "Bitcoin", price: 5000.0,symbol: "bitcoin",date: formatter(date: "10/10/2023")),
        Coin( name: "Litecoin", price: 2000.0,symbol: "Litecoin",date: formatter(date: "10/10/2023")),
        Coin( name: "Tron", price: 133.7,symbol: "tron",date: formatter(date: "10/10/2023")),
        Coin( name: "Bitcoin", price: 1000.0,symbol: "bitcoin",date: formatter(date: "11/10/2023")),
        Coin( name: "Litecoin", price: 1000.0,symbol: "Litecoin",date: formatter(date: "11/10/2023")),
        Coin( name: "Tron", price: 500.0,symbol: "tron",date: formatter(date: "11/10/2023")),
        Coin( name: "Bitcoin", price: 2000.0,symbol: "bitcoin",date: formatter(date: "12/10/2023")),
        Coin( name: "Litecoin", price: 4000.0,symbol: "Litecoin",date: formatter(date: "12/10/2023")),
        Coin( name: "Tron", price: 300.7,symbol: "tron",date: formatter(date: "12/10/2023"))
    ]
    
    private func getAllTheAmountPerDay(rates: [Coin]) -> [Date:Float]{
        var myBalance: [Date:Float] = [:]
        for myWallet in myWallet{
            let dictionaryKeys = Array(myBalance.keys)
            if(dictionaryKeys.contains(myWallet.date)){
                myBalance[myWallet.date] = myWallet.price + myBalance[myWallet.date]!
            }else{
                myBalance[myWallet.date] = myWallet.price
            }
        }
        return myBalance
    }

    private func getListOfAmounts(balance: [Date:Float]) -> [Amount]{
        var amounts : [Amount] = []
        for (key,value) in balance{
            let amount : Amount = Amount(date:key,amount:value)
            amounts.append(amount)
        }
        return amounts.sorted(by: {$0.date > $1.date})
    }
    
    public func getRateDataAndConvertItToAmountsPerDay(data: [Coin]) -> Void{
        coinValues = data
        coinPerDay = getAllTheAmountPerDay(rates: coinValues)
        amountPerDay = getListOfAmounts(balance: coinPerDay)
    }
    
}
