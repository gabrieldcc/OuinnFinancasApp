//
//  ViewController.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 28/05/22.
//

import UIKit

class ViewController: UIViewController {

    
    
    //MARK: Life Cycle View
    override func viewDidLoad() {
        super.viewDidLoad()
        
//
//        DolarAPI().makeRequest { (objetoDecodificado) in
//            self.dolarLabel.text = "Dólar: \(objetoDecodificado.USDBRL.ask)"
//            self.ibovespaLabel.text = "Ibovespa: \( self.ibovespa)"
//            self.selicLabel.text = "Selic: \( self.selic)"
//
           homeTableView.dataSource = self
            homeTableView.delegate = self
        }
    
    @IBOutlet weak var homeTableView: UITableView!
    
    
    
    
    
    
    
    
    }
    
    


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "ola"
        
        return cell
    }
    
    
}


extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: self, options: nil)?.first as? HomeTableViewHeader
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        200
    }
}
