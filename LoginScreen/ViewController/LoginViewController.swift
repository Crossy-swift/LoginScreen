//
//  ViewController.swift
//  LoginScreen
//
//  Created by Артем Репин on 30.03.2021.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    
        logInButton.layer.cornerRadius = logInButton.layer.frame.height / 2
        
        view.backgroundColor = UIColor(red: 1.00, green: 0.75, blue: 0.28, alpha: 1.00)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tabBarController = segue.destination as? UITabBarController {
            guard let viewControllers = tabBarController.viewControllers else { return }
            for viewController in viewControllers {
                if let welcomeVC = viewController as? WelcomeViewController {
                    welcomeVC.name = user.name
                }
            }
        }
    }
    
    @IBAction func logInButtonPressed() {
        if userNameTextField.text != user.userName ||
            passwordTextField.text != user.password
        {
            showMassage(
                with: "Incorrect Password or User Name!",
                message: "Please, enter your correct Password or User Name"
            )
        }
        
        performSegue(withIdentifier: "nextScreen", sender: nil)
    }
    
    
    @IBAction func forgotNameButtonPressed() {
        showMassage(
            with: "Forgot Name?",
            message: "Your correct User Name: \(user.userName)"
        )
    }
    
    
    @IBAction func forgotPassButtonPressed() {
        showMassage(
            with: "Forgot Password?",
            message: "Your correct Password: \(user.password)"
        )
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text?.removeAll()
        passwordTextField.text?.removeAll()
    }
    
    
}

// MARK: - Extension

extension LoginViewController {
    private func showMassage(with title: String, message: String) {
        let message = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let massageButton = UIAlertAction(title: "Thanks!", style: .default) { _ in
            self.passwordTextField.text?.removeAll()
        }
        message.addAction(massageButton)
        present(message, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInButtonPressed()
        }
        return true
    }
}
