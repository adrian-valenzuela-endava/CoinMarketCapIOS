//
//  LogInViewModel.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 14/06/2023.
//

import Foundation

class LogInViewModel: ObservableObject{
    @Published var password: String
    @Published var email: String
    
    init() {
        password = ""
        email = ""
    }
}
