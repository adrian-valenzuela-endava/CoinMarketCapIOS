//
//  CryptoLogoView.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 04/08/2023.
//

import SwiftUI

struct CryptoLogoView: View {
    var body: some View {
        Image("HomeImage").frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(Color("MainPageBackgroudColor")) 
    }
}

struct CryptoLogoView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoLogoView()
    }
}
