//
//  RatePercentajeChip.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 26/07/2023.
//

import SwiftUI

struct RatePercentageChip: View {
    var body: some View {
        HStack{
            
        }.padding(.bottom)
    }
}

struct RateChip<T>: View{
    let item: T
    let getImage:((T) -> String)
    let getPercentage: ((T) -> Double)
    let getBackgroundColor: ((T) -> String)
    
    var body: some View{
        
        HStack{
            Image(systemName: (getImage(item)))
                .foregroundColor(Color("RateChipLabelColor"))
                .font(.system(size: 15))

    
            Text(String(format: "%.2f",getPercentage(item)) + "%")
                .font(.custom("Mulish",fixedSize: 15))
                .foregroundColor(Color("RateChipLabelColor"))
        }.frame(width: 90,height: 30)
            .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(Color(getBackgroundColor(item)))
            ).background(Color(getBackgroundColor(item)))
                .cornerRadius(8)
    }
    
}

struct RatePercentageChip_Previews: PreviewProvider {
    static var previews: some View {
        HStack{
            RateChip<RateData>(item: RateData(image: "arrow.up.right", rate: 15.3, backgroundColor: "PositiveRateBackgroundColor"), getImage:{item in return item.image} ,getPercentage:{ item in return item.rate},getBackgroundColor:{ item in return item.backgroundColor})
        }
    }
}

