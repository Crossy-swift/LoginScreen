//
//  HobbiesViewController.swift
//  LoginScreen
//
//  Created by Артем Репин on 03.04.2021.
//

import UIKit

class HobbiesViewController: UIViewController {

    
    @IBOutlet var hobbiesImage: UIImageView!
    
    @IBOutlet var hobbiesSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hobbiesSegmentedControl.selectedSegmentTintColor = UIColor(red: 1.00, green: 0.75, blue: 0.28, alpha: 1.00)

        hobbiesImage.image = UIImage(named: "товар.jpeg")

        view.backgroundColor = UIColor(red: 1.00, green: 0.75, blue: 0.28, alpha: 1.00)
    }


    @IBAction func hobbiesSegmentChange() {
        switch hobbiesSegmentedControl.selectedSegmentIndex {
        case 0:
            hobbiesImage.image = UIImage(named: "товар.jpeg")
        case 1:
            hobbiesImage.image = UIImage(named: "воровство.jpeg")
        default:
            hobbiesImage.image = UIImage(named: "сахар.jpeg")
        }
    }
}
