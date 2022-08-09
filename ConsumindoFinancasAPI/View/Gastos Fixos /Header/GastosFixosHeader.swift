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
    
    //MARK: - IBAction
    @IBAction func addButton(_ sender: Any) {
        addGastosFixosInGastosFixosVcArray()
        limpaTextField()
        gastosFixosVC?.tableView?.reloadData()
    }

    //MARK: - Funcs
    func configuraHeader() {
        headerView.layer.cornerRadius = 10
        headerView.layer.masksToBounds = true
    }
    
    func limpaTextField() {
        tipoDeGastoTextField.text = ""
        valorFixoTextField.text = ""
    }
    
    func addGastosFixosInGastosFixosVcArray() {
        guard let tipoDeGasto = tipoDeGastoTextField.text, let valorGasto = valorFixoTextField.text, let valorGastoDouble = Double(valorGasto) else { return }
        let gastosFixosObject = GastosFixos(tipoDeGastoFixo: tipoDeGasto, valorGastoFixo: valorGastoDouble)
        
        gastosFixosVC?.gastosFixosArray.append(gastosFixosObject)
    }
    
}

    // to do
//guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
//let caminho = diretorio.appendingPathComponent("GastoFixo")
//print(caminho)
//
//do {
//    let dados = try NSKeyedArchiver.archivedData(withRootObject: viewController?.gastosFixosArray, requiringSecureCoding: false)
//    try dados.write(to: caminho)
//} catch {
//    print(error.localizedDescription)
//}

