//
//  LogInController.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 18/06/2023.
//

import UIKit
import FirebaseAnalytics

class LogInController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Analytics.logEvent("InitScreen", parameters: ["Message" : "FIrebase integration complete"])
    }
}
