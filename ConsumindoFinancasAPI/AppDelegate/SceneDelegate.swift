//
//  SceneDelegate.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 28/05/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let vc = LoginViewController()
        self.window?.rootViewController = vc
        self.window?.windowScene = windowScene
        self.window?.makeKeyAndVisible()
    }
}


