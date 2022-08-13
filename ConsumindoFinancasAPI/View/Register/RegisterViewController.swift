//
//  RegisterViewController.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 13/08/22.
//

import UIKit

final class RegisterViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Funcs
    private func changeToLoginVC() {
        dismiss(animated: true)
    }
    
    //MARK: - IBAction
    @IBAction func registerButton(_ sender: Any) {
        
    }
    
    @IBAction func loginButton(_ sender: Any) {
        changeToLoginVC()
    }
    

}
