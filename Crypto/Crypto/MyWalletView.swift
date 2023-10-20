//
//  MyWalletView.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 01/06/2023.
//

import SwiftUI

struct MyWalletView: View {
    
    var myWallet: [Coin] = [
        Coin(id: "BTC", name: "Bitcoin", price: "1000.0",icon: "bitcoin"),
        Coin(id: "LTC", name: "Litecoin", price: "2000.0",icon: "Litecoin"),
        Coin(id: "TRX", name: "Tron", price: "133.7",icon: "tron")
    ]
    
    var body: some View {
        List(){
            Section(header: Text("Current Prices")){
                ForEach(myWallet, id:\.self ) {
                    coin in
                    HStack{
                        Image(coin.icon)
                        Text(coin.name)
                        Spacer()
                        Text("$\(coin.price)")
                    }
                }
            }
        }
    }
}

struct MyWalletView_Previews: PreviewProvider {
    static var previews: some View {
        MyWalletView()
    }
}
