//
//  HomeViewModel.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 26/10/2023.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject{
    @Environment(\.colorScheme) var colorScheme
    @Published var isDarkMode = false
    
    func toggleDarkMode(){
        self.isDarkMode.toggle()
    }
    
}
