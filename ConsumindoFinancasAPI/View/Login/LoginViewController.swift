//
//  LoginViewController.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 13/08/22.
//

import UIKit

final class LoginViewController: UIViewController {
    
    
    //MARK: - Vars
    private let validator = Validator()
    
    //MARK: - IBOutlets
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPasswordTextField()
    }
    
    //MARK: - Funcs
    private func changeToRegisterVC() {
        let controller = RegisterViewController()
        present(controller, animated: true)
    }
    
    func setupPasswordTextField() {
        passwordTextField.isSecureTextEntry = true
    }
    
}

//MARK: - IBActions
private extension LoginViewController {
    
    @IBAction func emailTextFieldEditing(_ sender: UITextField) {
        validateButton()
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
    }
    
    @IBAction func registerButton(_ sender: Any) {
        changeToRegisterVC()
    }
}

private extension LoginViewController {
    
    func validateButton() {
        guard let email = emailTextField.text else { return }
        let validator = validator.validateEmail(textField: email)
        print("o validator é \(validator)")
        if  validator {
            self.enableButton()
        } else {
            self.disableButton()
        }
    }
    
    func disableButton() {
        loginButton.backgroundColor = .gray
        loginButton.isEnabled = false
    }
    
    func enableButton() {
        let customGreenColor = UIColor(red: 0/255, green: 255/255, blue: 235/255, alpha: 1)
        loginButton.backgroundColor = customGreenColor
        loginButton.isEnabled = true
    }
    
}



