//
//  GastosFixosViewController.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 03/06/22.
//

import UIKit

protocol GastosFixosViewControllerDelegate: AnyObject {
    func totalGastosFixos(total: Double)
}

final class GastosFixosViewController: UIViewController {
    
    
    //MARK: Vars
    var alerta = Alerta()
    var gastosFixosArray: [GastosFixos] = []
    var totalGastosFixos: Double?
    weak var delegate: GastosFixosViewControllerDelegate?
    var gastosFixosDao = GastosFixosDao()
    
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        gastosFixosArray = gastosFixosDao.recoverData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.totalGastosFixos(total: sumGastosFixos())
    }
    
    //MARK: - Funcs
    
    func sumGastosFixos() -> Double  {
        var total = 0.0
        for valor in gastosFixosArray {
            total += valor.valorGastoFixo
        }
        return total
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(UINib(nibName: "GastosFixosTableViewCell", bundle: nil), forCellReuseIdentifier: "GastosFixosTableViewCell")
    }
    
    
    
    
    
}


//MARK: - Tableview
extension GastosFixosViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = Bundle.main.loadNibNamed("GastosFixosHeader", owner: self, options: nil)?.first as? GastosFixosHeader else { return nil }
        
            header.setupHeader()
            header.gastosFixosVC = self
            header.totalLabel.text = "R$ \(sumGastosFixos())"
            
            return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 192
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
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(showAlert(_:)))
        cellGastosFixos.addGestureRecognizer(longPress)
        
        return cellGastosFixos
    }
    
    @objc func showAlert(_ gesture: UILongPressGestureRecognizer) {
        let gestureBegan = gesture.state == .began
        let celula = gesture.view as! UITableViewCell
        guard let indexPath = tableView.indexPath(for: celula) else { return }
        let gastoFixo = gastosFixosArray[indexPath.row]
        
        if  gestureBegan {
            
            alerta.show(controller: self, title: "Deletar", message: "Você realmente deseja deletar \(gastoFixo.tipoDeGastoFixo)?", handler: { alerta in
                self.gastosFixosArray.remove(at: indexPath.row)
                self.tableView.reloadData()
            })
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gastosFixosArray.count
    }
}


