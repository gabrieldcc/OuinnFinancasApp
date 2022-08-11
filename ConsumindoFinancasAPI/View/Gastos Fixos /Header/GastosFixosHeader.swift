//
//  GastosFixosHeader.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 03/06/22.
//

import UIKit

final class GastosFixosHeader: UIView {
    
    //MARK: - Vars
    var gastosFixosVC: GastosFixosViewController?
    
    //MARK: IBOutlets
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var tipoDeGastoTextField: UITextField!
    @IBOutlet weak var valorFixoTextField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var infoBarBackgroundView: UIView!
    
    //MARK: - IBAction
    @IBAction func addButton(_ sender: Any) {
        addGastosFixosInGastosFixosVcArray()
        cleanUpTextField()
        gastosFixosVC?.tableView?.reloadData()
    }

    //MARK: - Funcs
    func setupHeader() {
        headerView.layer.cornerRadius = 20
        headerView.layer.masksToBounds = true
        infoBarBackgroundView.layer.cornerRadius = 10
        infoBarBackgroundView.layer.masksToBounds = true
    }
    
    func cleanUpTextField() {
        tipoDeGastoTextField.text = ""
        valorFixoTextField.text = ""
    }
    
    func addGastosFixosInGastosFixosVcArray() {
        guard let tipoDeGasto = tipoDeGastoTextField.text, let valorGasto = valorFixoTextField.text, let valorGastoDouble = Double(valorGasto) else { return }
        let gastosFixosObject = GastosFixos(tipoDeGastoFixo: tipoDeGasto, valorGastoFixo: valorGastoDouble)
        
        gastosFixosVC?.gastosFixosArray.append(gastosFixosObject)
    }
    
}

