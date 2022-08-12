//
//  UIViewControllerDefault.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 12/08/22.
//

import UIKit

class UIViewControllerDefault: UIViewController {
    
    //MARK: - Vars
    var afterHideKeyboard: (() -> Void)?
    var afterShowKeyboard: ((_ heightKeyboard: CGFloat) -> Void)?
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupKeyBoardToHideItWhenUserTapOutsideTheTextField()
    }
    
    //MARK: - Setup Show and Hide Keyboard
    func setupKeyBoardToHideItWhenUserTapOutsideTheTextField() {
        let _: NSObjectProtocol = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (notification) in
            guard let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
            
            self.afterShowKeyboard?(value.cgRectValue.height)
        }
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboardByTappingOutside))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyboardByTappingOutside() {
        self.view.endEditing(true)
        self.afterHideKeyboard?()
    }

}

