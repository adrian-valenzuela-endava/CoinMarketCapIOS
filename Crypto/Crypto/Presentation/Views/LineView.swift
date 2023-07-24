//
//  LineChartView.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 02/06/2023.
//

import SwiftUI
import Charts
import Foundation

struct LineView: View {
    @State var historyCryptoAmount: [Amount]

    var body: some View {
        GeometryReader{
            reader in
            VStack(alignment: .center){
                Text("Last 24 hs")
                    .font(.title)
                    .foregroundColor(Color("MainColor"))
                    .fontWeight(.bold)
                Chart(historyCryptoAmount){coin in
                    LineMark(x: .value("Date", coin.date),
                             y: .value("Price", coin.amount)
                    )
                    .foregroundStyle(.red)
                    
                }
                .frame(width: reader.size.width,height: 300)
                        .background(Color.gray.opacity(0.2))
            }
            .padding(.horizontal, -12.0)
            .frame(height: 350)
        }
    }
}

struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        LineView(historyCryptoAmount: [Amount(date: Date(), amount: 0.0)])
    }
}
