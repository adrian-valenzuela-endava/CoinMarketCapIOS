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
    @State private var shouldToNavigateToCoinScreen: Bool = false
    
    var body: some View {
        ZStack{
            Spacer()
            if(!fetchError){
                if(shouldShowProgressAlert != true){
                        List(coins, id: \.id) { cryptocurrency in
                            Button(action: {
                                coinListViewModel.onCoinSelected(cryptocurrency: cryptocurrency)
                            }, label: {
                                HStack{
                                    SingleCoin<Cryptocurrency>(
                                        item: cryptocurrency,
                                        getName: { item in item.name },
                                        getSymbol: { item in item.symbol },
                                        getSlug: { item in item.slug },
                                        getQuote: { item in item.quote }
                                    )
                                }
                            })
                       
                    }
                }
                else{
                    SpinnerView()
                }
            }else{
                CryptoServiceFailView()
            }
        }
        .navigationDestination(isPresented: $shouldToNavigateToCoinScreen, destination: {
            if let cryptoCurrencySelected = coinListViewModel.state.cryptoCurrencySelected{
                SIngleCoinView( coinData: cryptoCurrencySelected, rateData: RateData(image: "", rate: 0, backgroundColor: ""), prices: [], onBackButtonPressed: {
                    coinListViewModel.onReturnFromCryptocurrencyDetailPage()
                })
            }
           
        })
        .navigationBarTitle("Cryptocurrencies")
        .onAppear {
            coinListViewModel.fetchCryptocurrencyData()
        }
        .onReceive(coinListViewModel.$state) { state in
            shouldShowProgressAlert = state.isProgress
            coins = state.cryptoCurrencies
            fetchError = state.hasError
            shouldToNavigateToCoinScreen = state.shouldToNavigateToCoinScreen
        }
    }
}

struct CoinListView_Previews: PreviewProvider {
    static var previews: some View {
        CoinListView()
    }
}
