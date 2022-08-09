//
//  GastosFixosTableViewCell.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 02/06/22.
//

import UIKit


final class HomeGastosFixosTableViewCell: UITableViewCell {

    var gastosFixosVC = GastosFixosViewController()

    //MARK: IBOulets
    @IBOutlet weak var valorTotalLabel: UILabel!
    
    
    func setupCell(total: Double) {
        valorTotalLabel.text = "\(total)"
    }
    
}

