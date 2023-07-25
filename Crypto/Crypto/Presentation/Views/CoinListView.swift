//
//  TestViewView.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 17/07/2023.
//

import SwiftUI

struct CoinListView: View {
    @ObservedObject var coinListViewModel = CoinListViewModel()
    
    var body: some View {
        NavigationView {
            List(coinListViewModel.cryptocurrencies, id: \.id) { cryptocurrency in
                NavigationLink(destination: SIngleCoinView( coinData: cryptocurrency, prices: [])) {
                    HStack{
                        SingleCoin<Cryptocurrency>(
                            item: cryptocurrency,
                            getName: { item in item.name }, // Corrected closure syntax
                            getSymbol: { item in item.symbol },
                            getSlug: { item in item.slug },
                            getQuote: { item in item.quote }
                        )
                    }
                }
            }
            .navigationBarTitle("Cryptocurrencies")
        }
        .onAppear {
            coinListViewModel.fetchCryptocurrencyData()
        }
    }
}

struct CoinListView_Previews: PreviewProvider {
    static var previews: some View {
        CoinListView()
    }
}
