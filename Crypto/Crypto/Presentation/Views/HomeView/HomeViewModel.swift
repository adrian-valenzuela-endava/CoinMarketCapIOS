//
//  HomeViewModel.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 26/10/2023.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject{
    @Published var isDarkMode = false
    
    func toggleMode(mode: EnvironmentMode){
        switch mode {
        case .ligthMode:
            self.isDarkMode = false
        case .darkMode:
            self.isDarkMode = true
        }
    }
    
}
