//
//  SpinnerView.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 24/10/2023.
//

import SwiftUI

struct SpinnerView: View {
    var body: some View {
            ProgressView()
            .frame(width: 200, height: 200)
                .progressViewStyle(CircularProgressViewStyle(tint: Color(#colorLiteral(red: 0.3686274588108063, green: 0.8705882430076599, blue: 0.6000000238418579, alpha: 1))))
        }
}

#Preview {
    SpinnerView()
}
