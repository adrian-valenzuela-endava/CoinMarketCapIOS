//
//  IconView.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 01/06/2023.
//

import SwiftUI

struct IconView: View {
    var body: some View {
        Image("Icon")
            .resizable()
            .frame(width: 90,height: 90)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 1))
            .shadow(radius: 10)
    }
}

struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView()
    }
}
