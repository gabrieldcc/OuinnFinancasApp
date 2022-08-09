//
//  ViewController.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 28/05/22.
//

import UIKit

final class HomeViewController: UIViewController {
    
    //MARK: - Vars
    var gastosFixosVC: GastosFixosViewController?
    var gastosFixos: Double = 0.0
    var homeGastosFixosTableViewCell: HomeGastosFixosTableViewCell?
    var homeGastosFixosCell = HomeGastosFixosTableViewCell()
    
    //MARK: IBOutlets
    @IBOutlet weak var homeTableView: UITableView!
    
    //MARK: Life Cycle View
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupTotal()
    }
    
    //MARK: - Funcs
    
    func setupTableView() {
        self.homeTableView.dataSource = self
        self.homeTableView.delegate = self
        self.homeTableView.register(UINib(nibName: "HomeGastosFixosTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeGastosFixosTableViewCell")
    }
    
    func soma(_ total: Double) {
        gastosFixos = total
        self.homeTableView.reloadData()
    }
    
    func setupTotal() {
        gastosFixosVC?.sumGastosFixos(totalD: gastosFixos)
    }
    
}


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cellGastosFixos = tableView.dequeueReusableCell(withIdentifier: "HomeGastosFixosTableViewCell") as? HomeGastosFixosTableViewCell else {
            fatalError("error to create HomeGastosFixosTableViewCell")
        }
        
        cellGastosFixos.valorTotalLabel.text = "\(gastosFixos)"
        return cellGastosFixos
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}


extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: self, options: nil)?.first as? HomeTableViewHeader
        header?.configuraViewHeader()
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        navigationController?.pushViewController(GastosFixosViewController(), animated: true)
    }
    
}

   
    
    

