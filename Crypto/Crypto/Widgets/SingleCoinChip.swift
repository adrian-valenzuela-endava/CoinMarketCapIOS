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
    let getIcon: ((T) -> String)
    let getName: ((T) -> String)
    let getPrice: ((T) -> Float)
    let getDate: ((T) -> Date)
    
    var body: some View{
        HStack{
            Image(getIcon(item))
                .resizable()
                .frame(width: 64,height: 64)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 1))
                .shadow(radius: 10)
            
            Text(getName(item))
            Text("$\(getPrice(item).rounded(.up))")
        }
        .background(Color("lightGrey"))
        
    }
    
}

struct SingleCoinChip_Previews: PreviewProvider {
    static var previews: some View {
        SingleCoin<Coin> (item: Coin( name: "Bitcoin", price: 54.384,icon: "Icon", date: formatter(date: "09/10/2023")), getIcon:{item in return item.icon} ,getName:{ item in return item.name},getPrice:{ item in return item.price}, getDate: {item in return item.date})
    }
}
