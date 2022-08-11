//
//  ViewController.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 28/05/22.
//

import UIKit

final class HomeViewController: UIViewController, GastosFixosViewControllerDelegate {
    
    //MARK: - Vars
    var gastosFixosVC = GastosFixosViewController()
    var gastosFixos: Double = 0.0
    
    //MARK: - IBOutlets
    @IBOutlet weak var homeTableView: UITableView!
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        gastosFixosVC.delegate = self
    }
    
    //MARK: - Funcs
    func setupTableView() {
        self.homeTableView.dataSource = self
        self.homeTableView.delegate = self
        self.homeTableView.register(UINib(nibName: "HomeGastosFixosTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeGastosFixosTableViewCell")
    }
    
    func totalGastosFixos(total: Double) {
        self.gastosFixos = total
        homeTableView.reloadData()
    }
    
}

    //MARK: - Tableview
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cellGastosFixos = tableView.dequeueReusableCell(withIdentifier: "HomeGastosFixosTableViewCell") as? HomeGastosFixosTableViewCell else {
            fatalError("error to create HomeGastosFixosTableViewCell")
        }
        
        cellGastosFixos.valorTotalLabel.text = "\(self.gastosFixos)"
        return cellGastosFixos
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}


extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: self, options: nil)?.first as? HomeTableViewHeader else { return UIView() }
        
        header.configuraViewHeader()
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexPath.row
        navigationController?.pushViewController(gastosFixosVC, animated: true)
    }
    
}

   
    
    

