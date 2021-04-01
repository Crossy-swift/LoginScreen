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
    
    private let userName = "Stranger"
    private let password = "LetMeIn"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    
        logInButton.layer.cornerRadius = logInButton.layer.frame.height / 5
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.user = userName
    }
    
    @IBAction func logInButtonPressed() {
        if userNameTextField.text != userName ||
            passwordTextField.text != password {
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
            message: "Your correct User Name: \(userName)"
        )
    }
    
    
    @IBAction func forgotPassButtonPressed() {
        showMassage(
            with: "Forgot Password?",
            message: "Your correct Password: \(password)"
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
