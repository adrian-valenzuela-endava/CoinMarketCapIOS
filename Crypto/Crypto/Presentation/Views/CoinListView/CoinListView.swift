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
    
    var body: some View {
        NavigationView {
            List(coinListViewModel.state.cryptoCurrencies, id: \.id) { cryptocurrency in
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
        .overlay {
            // TODO: IMPLEMENT LOADING PROGRESS. USE $shouldShowProgressAlert TO DEFINE IF IT SHOULD BE VISIBLE OR NOT.
        }
        .onAppear {
            coinListViewModel.fetchCryptocurrencyData()
        }
        .onReceive(coinListViewModel.$state) { state in
            shouldShowProgressAlert = state.isProgress
            // TODO: IMPLEMENT HERE THE ERROR HANDLING IN CASE state.error IS TRUE
        }
    }
}

struct CoinListView_Previews: PreviewProvider {
    static var previews: some View {
        CoinListView()
    }
}
