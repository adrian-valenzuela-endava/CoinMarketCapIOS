//
//  LineViewModel.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 12/06/2023.
//

import Foundation

class SingleCoinViewModel: ObservableObject{
    
    @Published var coinValues: Cryptocurrency
    @Published var singleCoinValues: [Amount]
    @Published  var rateData: RateData
    @Published var prices: [Double]
    
    init() {
        coinValues = Cryptocurrency(id: 0, name: "", symbol: "", slug: "", quote: Quote(USD: QuoteDetail(price: 0, volume_24h: 0, volume_change_24h: 0, percent_change_1h: 0, percent_change_24h: 0, percent_change_7d: 0, market_cap: 0, market_cap_dominance: 0, fully_diluted_market_cap: 0, last_updated: "")))
        singleCoinValues = []
        prices = []
        rateData = RateData(image: "", rate: 0.0, backgroundColor: "")
    }
    
    private func getListOfAmounts(){
        var amounts: [Amount] = []
        let yesterdayAmount = Amount(date: yesterDay(), amount: priceDifference(cryptoCurrency: coinValues))
        amounts.append(yesterdayAmount)
        amounts.append(Amount(date: today(), amount: coinValues.quote.USD.price))
        singleCoinValues = amounts.sorted(by: {$0.date > $1.date});
    }
    
    func chargeCoinData(cryptocurrency: Cryptocurrency){
        coinValues = cryptocurrency
        var priceList: [Double] = []
        priceList.append(Double(coinValues.quote.USD.price))
        priceList.append(Double(priceDifference(cryptoCurrency: coinValues)))
        prices = priceList
        if coinValues.quote.USD.percent_change_24h > 0{
            rateData = RateData(image: "arrow.up.right", rate: coinValues.quote.USD.percent_change_24h, backgroundColor: "PositiveRateBackgroundColor")
        }
        else if coinValues.quote.USD.percent_change_24h < 0{
            rateData = RateData(image: "arrow.down.right", rate: coinValues.quote.USD.percent_change_24h, backgroundColor: "NegativeRateBackgroundColor")
        }
    }
    
    func priceDifference(cryptoCurrency: Cryptocurrency) -> Double{
        let todayPrice = cryptoCurrency.quote.USD.price
        let percentChange = cryptoCurrency.quote.USD.percent_change_24h
        return todayPrice + (todayPrice * percentChange/100)
    }
    
    func yesterDay() -> Date {
        var dayComponent = DateComponents()
        dayComponent.day = -1
        let calendar = Calendar.current
        let nextDay =  calendar.date(byAdding: dayComponent, to: Date())!
        return nextDay
    }
    
    func today() -> Date{
        var dayComponent = DateComponents()
        dayComponent.day = 0
        let calendar = Calendar.current
        let today =  calendar.date(byAdding: dayComponent, to: Date())!
        return today
    }
        
}
