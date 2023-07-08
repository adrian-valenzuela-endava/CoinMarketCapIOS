//
//  MainViewModel.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 30/06/2023.
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject{
    @Published var logInViewModelState : Bool
    
    init() {
        self.logInViewModelState = false
    }
    
    func logInApprobed(){
        logInViewModelState = true
    }
}
