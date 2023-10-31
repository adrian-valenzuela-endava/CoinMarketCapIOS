//
//  TestViewView.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 17/07/2023.
//

import SwiftUI

struct CoinListView: View {
    @ObservedObject var coinListViewModel = CoinListViewModel(coinFetchUseCase: DefaultCoinFetchUseCase(coinRepository: CoinMarketApiFetch(coinApi: CoinMarketCapApiProtocol())))
    @State private var shouldShowProgressAlert: Bool = false
    @State private var coins: [Cryptocurrency] = []
    @State private var fetchError: Bool = true
    
    var body: some View {
        ZStack{
            Spacer()
            if(!fetchError){
                if(shouldShowProgressAlert != true){
                    NavigationView {
                        List(coins, id: \.id) { cryptocurrency in
                            NavigationLink(destination: SIngleCoinView( coinData: cryptocurrency, rateData: RateData(image: "", rate: 0, backgroundColor: ""), prices: [])) {
                                HStack{
                                    SingleCoin<Cryptocurrency>(
                                        item: cryptocurrency,
                                        getName: { item in item.name },
                                        getSymbol: { item in item.symbol },
                                        getSlug: { item in item.slug },
                                        getQuote: { item in item.quote }
                                    )
                                }
                            }
                        }
                        .navigationBarTitle("Cryptocurrencies")
                    }
                }
                else{
                    SpinnerView()
                }
            }else{
                CryptoServiceFailView()
            }
        }
        .onAppear {
            coinListViewModel.fetchCryptocurrencyData()
        }
        .onReceive(coinListViewModel.$state) { state in
            shouldShowProgressAlert = state.isProgress
            coins = state.cryptoCurrencies
            fetchError = state.hasError
        }
    }
}

struct CoinListView_Previews: PreviewProvider {
    static var previews: some View {
        CoinListView()
    }
}
