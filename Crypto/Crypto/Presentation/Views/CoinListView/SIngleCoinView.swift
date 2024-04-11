//
//  SIngleCoinView.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 04/06/2023.
//

import SwiftUI
import SwiftUICharts

struct SIngleCoinView: View {
    @ObservedObject var singleViewData = SingleCoinViewModel()
    @State var coinData : Cryptocurrency
    @State var rateData : RateData
    @State var prices :[Double]
    var onBackButtonPressed: (() -> Void)?
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack(alignment: .center){
            HStack(alignment: .center){
                Text("Price")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("MainColor"))
                Text("USD $" + String(format: "%.1f",coinData.quote.USD.price))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("MainColor"))
                    .padding(.leading)
            }
            .padding(.top)
            HStack(alignment: .center){
                Text("Last 24hs rate")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("MainColor"))
                RateChip<RateData>(
                    item: rateData,
                    getImage: { item in item.image },
                    getPercentage: { item in item.rate },
                    getBackgroundColor: { item in item.backgroundColor }
                )
            }
            .padding(.bottom)
            LineChartView(data: prices, title: "", legend: coinData.name, style: ChartStyle(backgroundColor: Color("MainView"), accentColor: Color.blue, secondGradientColor: .red, textColor: Color("MainView"), legendTextColor: Color.green, dropShadowColor:.yellow),form: ChartForm.extraLarge, rateValue: 0, dropShadow: false)
                .padding(.bottom,300.0)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            onBackButtonPressed?()
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Label("Back", systemImage: "chevron.left")
                        }
                    }
                }
        .padding(.top,90)
        .onAppear{
            singleViewData.chargeCoinData(cryptocurrency: coinData)
        }
        .onReceive(self.singleViewData.$prices){price in
            prices = price
        }.onReceive(self.singleViewData.$rateData){rateD in
            rateData = rateD
        }
    }
}

struct SIngleCoinView_Previews: PreviewProvider {
    static var previews: some View {
        SIngleCoinView(coinData: Cryptocurrency(id: 0, name: "", symbol: "", slug: "", quote: QuoteUi(USD: QuoteDetail(price: 0, volume_24h: 0, volume_change_24h: 0, percent_change_1h: 0, percent_change_24h: 0, percent_change_7d: 0, market_cap: 0, market_cap_dominance: 0, fully_diluted_market_cap: 0, last_updated: ""))), rateData: RateData(image: "", rate: 0.0, backgroundColor: ""), prices: [1.0])
    }
}
