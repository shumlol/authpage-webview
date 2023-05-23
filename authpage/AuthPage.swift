//
//  ViewController.swift
//  authpage
//
//  Created by Вадим Ахматханов on 17.05.2023.
//

import UIKit

class AuthPage: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let user = "1"
    private let password = "2"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? MainPage else { return }
        welcomeVC.user = user
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func loginPressed() {
        guard userNameTextField.text == user, passwordTextField.text == password else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and pssword",
                textField: passwordTextField
            )
            return
        }
        performSegue(withIdentifier: "openWelcomeVC", sender: nil)
    }
    
    @IBAction func forgotRegisterDate(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops!", message: "Your name is \(user)")
        : showAlert(title: "Oops!", message: "Your password is \(password)")
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}


