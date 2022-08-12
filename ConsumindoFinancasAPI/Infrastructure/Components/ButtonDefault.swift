//
//  ButtonDefault.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 11/08/22.
//

import UIKit

class UIButtonDefault: UIButton {
    
    init(title: String, color: UIColor, radius: CGFloat = 10, isEnabled: Bool = false) {
        super.init(frame: .zero)
        initDefault(title: title, color: color, radius: radius, isEnabled: isEnabled)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(title: String, color: UIColor, radius: CGFloat, isEnabled: Bool) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: .normal)
        self.backgroundColor = color
        self.setCornerRadius(radius: radius)
        self.isEnabled = isEnabled
    }
}
