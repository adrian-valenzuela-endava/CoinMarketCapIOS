//
//  Platform.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 18/07/2023.
//

import Foundation

struct Platform: Codable {
    let id: Int
    let name: String
    let symbol: String
    let slug: String
    let tokenAddress: String
}
