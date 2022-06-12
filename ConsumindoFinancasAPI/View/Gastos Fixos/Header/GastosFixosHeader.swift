//
//  GastosFixosHeader.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 03/06/22.
//

import UIKit



class GastosFixosHeader: UIView {
    
    var viewController: GastosFixosViewController?
    
    //MARK: IBOutlets
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var tipoDeGastoTextField: UITextField!
    @IBOutlet weak var valorFixoTextField: UITextField!
    
    //MARK: IBAction
    @IBAction func addButton(_ sender: Any) {
        guard let tipoDeGasto = tipoDeGastoTextField.text, let valorGasto = valorFixoTextField.text, let valorGastoDouble = Double(valorGasto) else {return}
        
        let gastosFixosObject = GastosFixos(tipoDeGastoFixo: tipoDeGasto, valorGastoFixo: valorGastoDouble)
        
        viewController?.gastosFixosArray.append(gastosFixosObject)
        limpaTextField()
        viewController?.tableView?.reloadData()
    }
    
    
    
    //MARK: Metodos
    func configuraHeader() {
        headerView.layer.cornerRadius = 10
        headerView.layer.masksToBounds = true
    }
    
    func limpaTextField() {
        tipoDeGastoTextField.text = ""
        valorFixoTextField.text = ""
    }
    
    
    
}