//
//  LoginView.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 10/08/22.
//

import UIKit

final class LoginView: UIView {
    
    //MARK: - Vars
    private var validator = Validator()
    private var vc = LoginViewController()
    
    //MARK: - Visual components
    
    lazy private var titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Login"
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        
        return lb
    }()
    
    lazy private var emailLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Email"
        lb.translatesAutoresizingMaskIntoConstraints = false
        
        return lb
    }()
    
    lazy private var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .opaqueSeparator
        tf.placeholder = "informe seu e-mail"
        tf.setCornerRadius(color: UIColor.black.cgColor, width: 0.5, radius: 10)
        
        return tf
    }()
    
    lazy private var passwordLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Password"
        lb.translatesAutoresizingMaskIntoConstraints = false
        
        return lb
    }()
    
    lazy private var passowrdTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.setCornerRadius(color: UIColor.black.cgColor, width: 0.5, radius: 10)
        tf.backgroundColor = .opaqueSeparator
        tf.placeholder = "informe sua senha"
        
        return tf
    }()
    
    lazy private var loginButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Entrar", for: .normal)
        bt.backgroundColor = .systemMint
        bt.setCornerRadius(radius: 10)
        bt.isEnabled = true
        
        return bt
    }()
    
    
    
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
        
        loginButton.addTarget(self, action: #selector(myTargetChangeViewControllerFunction), for: .touchUpInside)
    }
    
    @objc func myTargetChangeViewControllerFunction() {
        let controller = LoginViewController()
        controller.modalPresentationStyle = .fullScreen
        controller.present(HomeViewController(), animated: true)
        print("button tapped")
    }
    
    func showViewController(vc: UIViewController) {
        let vc = vc
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        window?.rootViewController = UINavigationController(rootViewController: vc)
        window?.makeKeyAndVisible()
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
