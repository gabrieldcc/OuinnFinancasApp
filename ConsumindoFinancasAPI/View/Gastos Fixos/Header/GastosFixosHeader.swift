//
//  GastosFixosHeader.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 03/06/22.
//

import UIKit

class GastosFixosHeader: UIView {


    //MARK: IBOutlets
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var tipoDeGastoTextField: UITextField!
    @IBOutlet weak var valorFixoTextField: UITextField!

    //MARK: IBAction
    @IBAction func addButton(_ sender: Any) {
    }
    
    
    
    //MARK: Metodos
    func configuraHeader() {
        headerView.layer.cornerRadius = 10
        headerView.layer.masksToBounds = true

    }
}
