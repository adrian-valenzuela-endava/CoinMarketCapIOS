//
//  LineViewModel.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 12/06/2023.
//

import Foundation

class SingleCoinViewModel: ObservableObject{
    
    @Published var coinValues: [Cryptocurrency]
    @Published var coinPerDay: [Date:Float]
    @Published var amountPerDay: [Amount]
    @Published var myWallet: [Cryptocurrency]
    @Published var singleCoinValues: [Cryptocurrency]
    
    init() {
        coinValues = []
        coinPerDay = [:]
        amountPerDay = []
        myWallet = []
        singleCoinValues = []
    }
    
    //private func getAllTheAmountPerDay(rates: [Coin]) -> [Date:Float]{
    //    var myBalance: [Date:Float] = [:]
    //    for myWallet in myWallet{
    //        let dictionaryKeys = Array(myBalance.keys)
    //        if(dictionaryKeys.contains(myWallet.date)){
    //            myBalance[myWallet.date] = myWallet.price + myBalance[myWallet]!
    //        }else{
    //            myBalance[myWallet.date] = myWallet.price
    //        }
    //    }
    //    return myBalance
    //}

    private func getListOfAmounts(balance: [Date:Float]) -> [Amount]{
        var amounts : [Amount] = []
        for (key,value) in balance{
            let amount : Amount = Amount(date:key,amount:value)
            amounts.append(amount)
        }
        return amounts.sorted(by: {$0.date > $1.date})
    }
    
    public func getRateDataAndConvertItToAmountsPerDay(data: [Cryptocurrency]) -> Void{
        coinValues = data
        //coinPerDay = getAllTheAmountPerDay(rates: coinValues)
        amountPerDay = getListOfAmounts(balance: coinPerDay)
    }
    
}
