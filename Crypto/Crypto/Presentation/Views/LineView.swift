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
    var historyCryptoAmount: [Amount] = []

    var body: some View {
        GeometryReader{
            reader in
            VStack{
                Chart(historyCryptoAmount){coin in
                    LineMark(x: .value("Date", coin.date),
                             y: .value("Price", coin.amount)
                    ).foregroundStyle(.red)
                }.frame(width: reader.size.width,height: 200)
            }
        }
        
    }
}

struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        LineView()
    }
}
