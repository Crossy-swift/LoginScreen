//
//  WelcomeViewController.swift
//  LoginScreen
//
//  Created by Артем Репин on 30.03.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeImage: UIImageView!
    
    @IBOutlet var welcomeLabel: UILabel!
    
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeImage.layer.cornerRadius = welcomeImage.frame.width / 2
        
        welcomeLabel.text = "Приветствую тебя, \(name ?? "Незнакомец")! Да укутают тебя тёплые пески Эльсвейра!"
        
        view.backgroundColor = UIColor(red: 1.00, green: 0.75, blue: 0.28, alpha: 1.00)
    }
}
