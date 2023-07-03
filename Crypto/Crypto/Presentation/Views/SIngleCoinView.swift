//
//  SIngleCoinView.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 04/06/2023.
//

import SwiftUI


struct SIngleCoinView: View {
    @ObservedObject var singleViewData: SingleCoinViewModel
    var coinData: [Coin]
    
    var body: some View {
        VStack{
            LineView.init(historyCryptoAmount: singleViewData.amountPerDay)
                .padding(.leading, 30)
        }
        .onAppear{
            singleViewData.getRateDataAndConvertItToAmountsPerDay(data: coinData)
        }
    }
}

struct SIngleCoinView_Previews: PreviewProvider {
    static var previews: some View {
        SIngleCoinView(singleViewData: SingleCoinViewModel(), coinData: SingleCoinViewModel().coinValues)
    }
}
