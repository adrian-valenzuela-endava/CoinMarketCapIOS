//
//  ProfileViewModel.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 26/10/2023.
//

import Foundation
import UIKit

class ProfileViewModel: ObservableObject{
    let gitHubURL = URL(string: "https://github.com/OrlandoNicolasMarchioli/SwiftFundamentals")!
    
    func openGitHubRepository(){
            UIApplication.shared.open(gitHubURL)
        }
}
