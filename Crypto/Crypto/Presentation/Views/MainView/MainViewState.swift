//
//  MainViewState.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 13/10/2023.
//

import Foundation

struct MainViewState{
    let isLogout: Bool
    
    func clone(withIsLogOut: Bool? = false) -> MainViewState {
        return MainViewState(isLogout: withIsLogOut ?? isLogout)
    }
}
