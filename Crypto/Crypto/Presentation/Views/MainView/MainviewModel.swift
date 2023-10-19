//
//  MainviewModel.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 13/10/2023.
//

import Foundation
import Combine

class MainViewModel: ObservableObject{
    @Published var state: MainViewState
    static let defaultState = MainViewState(isLogout: false)
    
    init(initialState: MainViewState = defaultState) {
        self.state = initialState
    }
}
