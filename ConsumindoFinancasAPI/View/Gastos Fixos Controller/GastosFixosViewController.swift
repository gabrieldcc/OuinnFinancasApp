//
//  GastosFixosViewController.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 03/06/22.
//

import UIKit

protocol GastosFixosDelegate: AnyObject {
    func soma(_ total: Double)
}

final class GastosFixosViewController: UIViewController {
    
    //MARK: Atributos
    var gastosFixosArray: [GastosFixos] = []
    weak var gastosFixosDelegate: GastosFixosDelegate?
    weak var gastosFixosDaoDelegate: GastosFixosDao?
    
    
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(UINib(nibName: "GastosFixosTableViewCell", bundle: nil), forCellReuseIdentifier: "GastosFixosTableViewCell")
        
        self.saveData()
      
        
        somaGastosFixos()
        
        print("quantidade de gastos fixos: \(gastosFixosArray.count)")
    }
    
    func saveData() {
    guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
    let caminho = diretorio.appendingPathComponent("GastoFixo")
    print(caminho)
    do {
        let dados = try Data(contentsOf: caminho)
        guard let gastosFixosSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? [GastosFixos] else {return}
        gastosFixosArray = gastosFixosSalvos
        try dados.write(to: caminho)
    } catch {
        print(error.localizedDescription)
    }
}
    
    override func viewWillDisappear(_ animated: Bool) {
        somaGastosFixos()
    }
    
    
    //MARK: Métodos
    func somaGastosFixos() {
        var total = 0.0
        for valor in gastosFixosArray {
            total += valor.valorGastoFixo
        }
        gastosFixosDelegate?.soma(total)
    }
}



//MARK: Extension UITableViewDelegate
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


//MARK: Extension UITableViewDataSource
extension GastosFixosViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cellGastosFixos = tableView.dequeueReusableCell(withIdentifier: "GastosFixosTableViewCell") as? GastosFixosTableViewCell else {
            fatalError("error to create GastosFixosTableViewCell")
        }
        let data = gastosFixosArray[indexPath.row]
        cellGastosFixos.tipoGastoLabel.text = data.tipoDeGastoFixo
        cellGastosFixos.valorFixoLabel.text = "\(data.valorGastoFixo)"
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarAlerta(_:)))
        cellGastosFixos.addGestureRecognizer(longPress)
        
        return cellGastosFixos
    }
    
    
    
    @objc func mostrarAlerta(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            
            let celula = gesture.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: celula) else {return}
            let gastoFixo = gastosFixosArray[indexPath.row]
            
            Alerta(controller: self).exibe(title: "Deletar", message: "Você realmente deseja deletar \(gastoFixo.tipoDeGastoFixo)?", handler: { alerta in
                self.gastosFixosArray.remove(at: indexPath.row)
                self.tableView.reloadData()
            })
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gastosFixosArray.count
    }
}


