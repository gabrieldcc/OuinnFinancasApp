//
//  LabelDefault.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 11/08/22.
//

import UIKit

class UILabelDefault: UILabel {
    
    init(text: String) {
        super.init(frame: .zero)
        iniDefault(text: text, font: 17, weight: .regular)
    }
    
    init(text: String, font: CGFloat, weight: UIFont.Weight) {
        super.init(frame: .zero)
         iniDefault(text: text, font: font, weight: weight)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func iniDefault(text: String, font: CGFloat, weight: UIFont.Weight) {
        self.text = text
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = UIFont.systemFont(ofSize: font, weight: weight)
        
    }
}
