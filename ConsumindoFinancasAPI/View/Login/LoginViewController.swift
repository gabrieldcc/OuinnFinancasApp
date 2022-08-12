//
//  LoginViewController.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 10/08/22.
//

import UIKit

class LoginViewController: UIViewController, LoginViewDelegate {
    
    lazy var loginView: LoginView = {
        let view = LoginView()
        view.backgroundColor = .white
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.delegate = self
    }
    
    override func loadView() {
        self.view = loginView
    }
    
    func targetLoginButtonPresentHomeVC() {
        let controller = HomeViewController()
        controller.modalPresentationStyle = .fullScreen
        present(createController(storyboardName: "Main", controllerName: "HomeViewController", typeOfController: HomeViewController.self), animated: true)
    }
    
    private func createController<T: UIViewController>(storyboardName: String, controllerName: String, typeOfController: T.Type) -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: controllerName) as! T
        return vc
    }
 
}
