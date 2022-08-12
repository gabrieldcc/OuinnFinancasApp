//
//  LoginView.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 10/08/22.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func targetLoginButtonPresentHomeVC()
}

final class LoginView: UIView {
    
    //MARK: - Vars
    private var validator = Validator()
    weak var delegate: LoginViewDelegate?
    
    
    
    //MARK: - Visual components
    
    lazy private var titleLabel = UILabelDefault(text: "Login", font: 25, weight: .semibold)
    lazy private var emailLabel = UILabelDefault(text: "Email", font: 16, weight: .semibold)
    lazy private var passwordLabel = UILabelDefault(text: "Senha", font: 16, weight: .semibold)
    
    lazy private var emailTextField = UITextFieldDefault(placeholder: "Email", keyboardType: .emailAddress)
    lazy private var passowrdTextField = UITextFieldDefault(placeholder: "Informe sua senha", isSecure: true)
    
    lazy private var loginButton = UIButtonDefault(title: "Entrar", color: .systemMint, isEnabled: true)
    lazy private var registerButton = UIButtonDefault(title: "Registrar", color: .systemMint)
    
    
    //MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupVisualComponents()
        emailTextField.text = "gabrieldcc@gmail.com"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup Visual Components
    private func setupVisualComponents() {
        setupTitle()
        setupEmail()
        setupPassword()
        setupLoginButton()
        setupRegisterButton()
    }
    
    private func setupTitle() {
        self.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
        ])
    }
    
    private func setupEmail() {
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            emailLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            emailLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 24),
            emailTextField.leftAnchor.constraint(equalTo: emailLabel.leftAnchor),
            emailTextField.rightAnchor.constraint(equalTo: emailLabel.rightAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        emailTextField.addTarget(self, action: #selector(myTargetEditingChangedFunction(textField:)), for: UIControl.Event.editingChanged)
    }
    
    @objc func myTargetEditingChangedFunction(textField: UITextField) {
        validateLoginButton()
    }
    
    
    private func setupPassword() {
        self.addSubview(passwordLabel)
        self.addSubview(passowrdTextField)
        
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 24),
            passwordLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            passwordLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            
            passowrdTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 24),
            passowrdTextField.leftAnchor.constraint(equalTo: passwordLabel.leftAnchor),
            passowrdTextField.rightAnchor.constraint(equalTo: passwordLabel.rightAnchor),
            passowrdTextField.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func setupLoginButton() {
        self.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passowrdTextField.bottomAnchor, constant: 24),
            loginButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            loginButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        loginButton.addTarget(self, action: #selector(myTargetButtton), for: .touchUpInside)
    }
    
    @objc func myTargetButtton() {
        delegate?.targetLoginButtonPresentHomeVC()
        print("tapped button")
    }
    
    private func setupRegisterButton() {
        self.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 24),
            registerButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            registerButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            registerButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    
}




private extension LoginView {
    
    func validateLoginButton() {
        guard let email = emailTextField.text else { return }
        let validator = validator.validateEmail(textField: email)
        if  validator {
            self.enableLoginButton()
        } else {
            self.disableLoginButton()
        }
    }
    
    func disableLoginButton() {
        loginButton.backgroundColor = .gray
        loginButton.isEnabled = false
    }
    
    func enableLoginButton() {
        loginButton.backgroundColor = .blue
        loginButton.isEnabled = true
    }
    
    
}
