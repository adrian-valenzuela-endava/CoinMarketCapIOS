//
//  SIngleCoinView.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 04/06/2023.
//

import SwiftUI


struct SIngleCoinView: View {
    @ObservedObject var singleViewData = SingleCoinViewModel()
    @State var coinData : Cryptocurrency
    
    var body: some View {
        VStack{
            LineView(historyCryptoAmount: singleViewData.singleCoinValues)
                .padding(.leading, 30)
        }
        .onAppear{
            singleViewData.chargeCoinData(cryptocurrency: coinData)
        }
    }
}

struct SIngleCoinView_Previews: PreviewProvider {
    static var previews: some View {
        SIngleCoinView(coinData: Cryptocurrency(id: 0, name: "", symbol: "", slug: "", quote: Quote(USD: QuoteDetail(price: 0, volume_24h: 0, volume_change_24h: 0, percent_change_1h: 0, percent_change_24h: 0, percent_change_7d: 0, market_cap: 0, market_cap_dominance: 0, fully_diluted_market_cap: 0, last_updated: ""))))
    }
}
