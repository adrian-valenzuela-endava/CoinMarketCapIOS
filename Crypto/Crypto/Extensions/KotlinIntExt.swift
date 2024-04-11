//
//  KotlinIntExt.swift
//  Crypto
//
//  Created by Adrian Jose Valenzuela on 25/03/2024.
//

import Foundation
import CmcApi

extension KotlinInt {
    func toInt() -> Int {
        return Int(truncating: self)
    }
}
