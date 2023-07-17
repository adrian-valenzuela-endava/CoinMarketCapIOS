//
//  SingleCoinChip.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 11/07/2023.
//

import SwiftUI

struct SingleCoinChip: View {
    var body: some View {
        HStack{
            
        }
    }
}

struct SingleCoin<T>: View{
    let item: T
    let getSymbol: ((T) -> String)
    let getName: ((T) -> String)
    let getPrice: ((T) -> Float)
    let getDate: ((T) -> Date)
    
    var body: some View{
        HStack{
            Image(getSymbol(item))
                .resizable()
                .frame(width: 64,height: 64)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 1))
                .shadow(radius: 10)
            
            Text(getName(item))
            Text("$\(getPrice(item).rounded(.up))")
        }
        .frame(width: .infinity,height: 60)
        .padding(10)
        .overlay(RoundedRectangle(cornerRadius: 8)
            .stroke(Color("lightGrey"))
        )        .background(Color("lightGrey"))
            .cornerRadius(8)
        
    }
    
}

struct SingleCoinChip_Previews: PreviewProvider {
    static var previews: some View {
        SingleCoin<Coin> (item: Coin( name: "Bitcoin", price: 54.384,symbol: "Icon", date: formatter(date: "09/10/2023")), getSymbol:{item in return item.symbol} ,getName:{ item in return item.name},getPrice:{ item in return item.price}, getDate: {item in return item.date})
    }
}
