//
//  ViewController.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 28/05/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var homeTableView: UITableView!
    
    //MARK: Life Cycle View
    override func viewDidLoad() {
        super.viewDidLoad()

            self.homeTableView.dataSource = self
            self.homeTableView.delegate = self
            self.homeTableView.register(UINib(nibName: "GastosFixosTableViewCell", bundle: nil), forCellReuseIdentifier: "GastosFixosTableViewCell")
        }

}



extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       guard let cellGastosFixos = tableView.dequeueReusableCell(withIdentifier: "GastosFixosTableViewCell") as? GastosFixosTableViewCell else {
            fatalError("error to create GastosFixosTableViewCell")
           
           
        }
            return cellGastosFixos
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    
}


extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: self, options: nil)?.first as? HomeTableViewHeader
        header?.configuraViewHeader()
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        200
    }
}
