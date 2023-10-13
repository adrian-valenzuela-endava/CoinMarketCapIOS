//
//  AlertViewModel.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 11/09/2023.
//

import Foundation

class AlertViewModel: ObservableObject{
    @Published var showAlert: Bool = false
    @Published var message: String = ""
}
