//
//  StoriesViewController.swift
//  LoginScreen
//
//  Created by Артем Репин on 03.04.2021.
//

import UIKit

class StoriesViewController: UIViewController {

    @IBOutlet var storyLabel: UILabel!
    
    @IBOutlet var nakedSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = UIColor(red: 1.00, green: 0.75, blue: 0.28, alpha: 1.00)
    }
    
    @IBAction func storyButtonChangePressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            storyLabel.text = MyPerfectStory.crab.rawValue
        case 1:
            storyLabel.text = MyPerfectStory.boethiah.rawValue
        case 2:
            storyLabel.text = MyPerfectStory.dwemer.rawValue
        case 3:
            storyLabel.text = MyPerfectStory.imperialCrab.rawValue
        case 4:
            storyLabel.text = MyPerfectStory.lich.rawValue
        default:
            storyLabel.text = MyPerfectStory.nakedLich.rawValue
        }
    }
    

    @IBAction func nakedSwitchSlide() {
        if nakedSwitch.isOn {
        storyLabel.text = person.reaction
        }
}
}
