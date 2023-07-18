//
//  TestViewModel.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 17/07/2023.
//

import Foundation
import SwiftUI

class CoinListViewModel: ObservableObject{
    @Published var cryptocurrencies: [Cryptocurrency] = []
        
        func fetchCryptocurrencyData() {
            guard let url = URL(string: "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=3b94c36c-e5a0-4adb-9593-5b4e00c693c9") else {
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data, error == nil else {
                    print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(CryptocurrencyResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.cryptocurrencies = response.data
                    }
                } catch {
                    print("Error decoding data: \(error.localizedDescription)")
                }
            }.resume()
        }
    
}
