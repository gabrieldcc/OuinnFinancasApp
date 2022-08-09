//
//  GastosFixosViewController.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 03/06/22.
//

import UIKit

final class GastosFixosViewController: UIViewController {
    
    //MARK: Vars
    var alerta = Alerta()
    var gastosFixosArray: [GastosFixos] = []
    var totalGastosFixos: Double?
    
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        saveData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //sumGastosFixos()
    }
    
    //MARK: - Funcs
    
    func sumGastosFixos(totalD: Double)   {
        var total = 0.0
        for valor in gastosFixosArray {
            total += valor.valorGastoFixo
        }
        total = totalD
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(UINib(nibName: "GastosFixosTableViewCell", bundle: nil), forCellReuseIdentifier: "GastosFixosTableViewCell")
    }
    
    func saveData() {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
        let caminho = diretorio.appendingPathComponent("GastoFixo")
        do {
            let dados = try Data(contentsOf: caminho)
            guard let gastosFixosSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? [GastosFixos] else {return}
            gastosFixosArray = gastosFixosSalvos
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}


//MARK: - Tableview
extension GastosFixosViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = Bundle.main.loadNibNamed("GastosFixosHeader", owner: self, options: nil)?.first as? GastosFixosHeader
        header?.configuraHeader()
        header?.gastosFixosVC = self
        //header?.totalLabel.text = "\(sumGastosFixos())"
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 241
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


