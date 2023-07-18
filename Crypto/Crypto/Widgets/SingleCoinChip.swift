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
    let getName: ((T) -> String)
    let getSymbol: ((T) -> String)
    let getSlug: String
    let getPrice: Float
    
    var body: some View{
        HStack{
            Image(getSymbol(item))
                .resizable()
                .frame(width: 64,height: 64)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 1))
                .shadow(radius: 10)
            VStack(alignment: .leading) {
                Text(getName(item))
                    .font(.headline)
                Text(getSymbol(item))
                    .foregroundColor(.secondary)
            }
            Spacer()
            //Text("USD Price: \(getPrice(item), specifier: "%.2f")")
        }
        .frame(width: .infinity,height: 60)
        .padding(10)
        .overlay(RoundedRectangle(cornerRadius: 8)
            .stroke(Color("lightGrey"))
        )        .background(Color("lightGrey"))
            .cornerRadius(8)
        
    }
    
}


