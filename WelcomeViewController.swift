//
//  WelcomeViewController.swift
//  LoginScreen
//
//  Created by Артем Репин on 30.03.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    
    @IBOutlet var welcomeLabel: UILabel!
    
    var welcomeMassage: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = welcomeMassage
    }
}
