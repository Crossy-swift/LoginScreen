//
//  AboutMeViewController.swift
//  LoginScreen
//
//  Created by Артем Репин on 03.04.2021.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var raceLabel: UILabel!
    @IBOutlet var jobLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    
    @IBOutlet var elsweyrImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        nameLabel.text = person.name
        raceLabel.text = MyBiography.race.rawValue
        jobLabel.text = MyBiography.job.rawValue
        ageLabel.text = MyBiography.age.rawValue
        
        view.backgroundColor = UIColor(red: 1.00, green: 0.75, blue: 0.28, alpha: 1.00)
    }
    
}
