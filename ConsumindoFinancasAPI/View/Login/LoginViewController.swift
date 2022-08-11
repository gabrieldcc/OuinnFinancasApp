//
//  LoginViewController.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 10/08/22.
//

import UIKit

class LoginViewController: UIViewController {

    lazy var loginView: LoginView = {
        let view = LoginView()
        view.backgroundColor = .white
        
        return view
    }()
    
    override func loadView() {
        self.view = loginView
    }
    
 
}
