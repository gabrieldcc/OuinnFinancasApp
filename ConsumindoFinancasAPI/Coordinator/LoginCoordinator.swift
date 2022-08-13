//
//  LoginCoordinator.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 12/08/22.
//

import UIKit

class LoginCoordinator: Coordinator {
    
    let navigationcontroller: UINavigationController
    
    init(navigationcontroller: UINavigationController) {
        self.navigationcontroller = navigationcontroller
    }
    
    func start() {
        let viewController = LoginViewController()
        //viewController.onLoginTap = {
            self.showRegisterVC()
        //}
        self.navigationcontroller.pushViewController(viewController, animated: true)
    }
    
    private func showRegisterVC() {
        let coordinator = RegisterCoordinator(navigationcontroller: self.navigationcontroller)
        coordinator.start()
    }
    
}
