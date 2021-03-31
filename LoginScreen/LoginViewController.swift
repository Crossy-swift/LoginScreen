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
    
    @IBOutlet var forgotNameButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        logInButton.layer.cornerRadius = logInButton.layer.frame.height / 5
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.welcomeMassage = "Welcome, \(userNameTextField.text ?? "")"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    
    @IBAction func logInButtonPressed() {
        if userNameTextField.text != "Stranger" ||
            passwordTextField.text != "LetMeIn" {
            showMassage(
                with: "Incorrect Password or User Name!",
                message: "Please, enter your correct Password or User Name"
            )
        }
    }
    
    
    @IBAction func forgotNameButtonPressed() {
        showMassage(
            with: "Forgot Name?",
            message: "Your correct User Name: Stranger"
        )
    }
    
    
    @IBAction func forgotPassButtonPressed() {
        showMassage(
            with: "Forgot Password?",
            message: "Your correct Password: LetMeIn"
        )
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        self.userNameTextField.text?.removeAll()
        self.passwordTextField.text?.removeAll()
    }
    
    
}

// MARK: - Extension

extension LoginViewController {
    private func showMassage(with title: String, message: String) {
        let message = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let massageButton = UIAlertAction(title: "Thanks!", style: .default) { _ in
            self.userNameTextField.text?.removeAll()
            self.passwordTextField.text?.removeAll()
        }
        message.addAction(massageButton)
        present(message, animated: true)
    }
}

