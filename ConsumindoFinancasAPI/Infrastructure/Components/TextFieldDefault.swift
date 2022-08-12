//
//  TextFieldDefault.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 11/08/22.
//

import UIKit

class UITextFieldDefault: UITextField {
    
    //MARK: - Constant
    let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)

    //MARK: - Inits
    init(placeholder: String, keyboardType: UIKeyboardType = .default) {
        super.init(frame: .zero)
        initDefault(placeholder: placeholder, keyboardType: keyboardType)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Funcs
    private func initDefault(placeholder: String, keyboardType: UIKeyboardType) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .opaqueSeparator
        self.placeholder = placeholder
        self.layer.borderWidth = 0.5
        self.keyboardType = keyboardType
    }
    
    //MARK: Add padding in textfield
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
}
