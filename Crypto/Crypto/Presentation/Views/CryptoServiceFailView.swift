//
//  CryptoServiceFailView.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 27/10/2023.
//

import SwiftUI

struct CryptoServiceFailView: View {
    var body: some View {
        ZStack{
            Color("MainViewBackgroundColor")
                .edgesIgnoringSafeArea(.horizontal)
            VStack(alignment: .center) {
                Image("coinApiFailed")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 1))
                    .padding(.top, 60)
                Text("Sorry could not connect to the serrver. Please swipe down for reload")
                    .padding(.top, 40)
                    .font(.title2)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

#Preview {
    CryptoServiceFailView()
}
