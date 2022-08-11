//
//  UIView+.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 11/08/22.
//

import UIKit

extension UIView {
    
    func setCornerRadius(color: CGColor = UIColor.white.cgColor, width: CGFloat = 0.5, radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        self.layer.borderWidth = width
        self.layer.borderColor = color
    }
    
}
