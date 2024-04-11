//
//  KotlinDoubleExt.swift
//  Crypto
//
//  Created by Adrian Jose Valenzuela on 25/03/2024.
//

import Foundation
import CmcApi

extension KotlinDouble {
    
    func toDouble() -> Double {
        return Double(truncating: self)
    }
    
}
