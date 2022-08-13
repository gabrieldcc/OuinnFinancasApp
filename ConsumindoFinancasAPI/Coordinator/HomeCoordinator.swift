//
//  RegisterCoordinator.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 12/08/22.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    
    let navigationcontroller: UINavigationController
    
    init(navigationcontroller: UINavigationController) {
        self.navigationcontroller = navigationcontroller
    }
    
    func start() {
        let viewController = HomeViewController()
        self.navigationcontroller.pushViewController(viewController, animated: true)
    }
    
    
}
