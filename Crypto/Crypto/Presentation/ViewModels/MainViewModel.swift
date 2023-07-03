//
//  MainViewModel.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 30/06/2023.
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject{
    
    @Published var state: MainViewModelState
    
    init(state: MainViewModelState) {
        self.state = state
    }
    
    func logInApprobed(){
        state = .mainViewHomeScreen
    }
    
}

enum MainViewModelState{
    case initialMainView
    case mainViewHomeScreen
}
