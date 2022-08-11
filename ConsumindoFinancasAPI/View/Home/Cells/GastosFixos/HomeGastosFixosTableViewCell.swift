//
//  GastosFixosTableViewCell.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 02/06/22.
//

import UIKit


final class HomeGastosFixosTableViewCell: UITableViewCell {

    //MARK: - Vars
    var gastosFixosVC = GastosFixosViewController()


    //MARK: - IBOulets
    @IBOutlet weak var valorTotalLabel: UILabel!
    
   
    
    //MARK: - Funcs
    func setupCell(total: Double) {
        valorTotalLabel.text = "\(total)"
        
    }
    
   
   
    
}

