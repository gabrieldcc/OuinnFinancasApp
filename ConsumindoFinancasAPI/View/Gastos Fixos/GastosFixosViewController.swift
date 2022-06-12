//
//  GastosFixosViewController.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 03/06/22.
//

import UIKit

class GastosFixosViewController: UIViewController {
    
    var gastosFixosArray: [GastosFixos] = []
    
    
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Life Cycle View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(UINib(nibName: "GastosFixosTableViewCell", bundle: nil), forCellReuseIdentifier: "GastosFixosTableViewCell")
    }
    
    //MARK: Métodos
    func somaGastosFixos() -> Double {
        var total = 0.0
        for valor in gastosFixosArray {
            total += valor.valorGastoFixo
        }
        return total
    }
    
    
    
    
}

extension GastosFixosViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = Bundle.main.loadNibNamed("GastosFixosHeader", owner: self, options: nil)?.first as? GastosFixosHeader
        header?.configuraHeader()
        header?.viewController = self
        return header
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        150
    }
}


extension GastosFixosViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cellGastosFixos = tableView.dequeueReusableCell(withIdentifier: "GastosFixosTableViewCell") as? GastosFixosTableViewCell else {
            fatalError("error to create GastosFixosTableViewCell")
        }
        let data = gastosFixosArray[indexPath.row]
        cellGastosFixos.tipoGastoLabel.text = data.tipoDeGastoFixo
        cellGastosFixos.valorFixoLabel.text = "\(data.valorGastoFixo)"
        
        return cellGastosFixos
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gastosFixosArray.count
    }
}


