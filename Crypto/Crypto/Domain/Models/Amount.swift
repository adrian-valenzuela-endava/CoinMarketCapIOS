//
//  Amount.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 10/06/2023.
//

import Foundation

struct Amount: Hashable,Identifiable {
    let id = UUID()
    let date : Date
    let amount : Double
}

