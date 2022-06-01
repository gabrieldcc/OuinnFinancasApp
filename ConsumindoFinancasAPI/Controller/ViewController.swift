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
        
        headerView.layer.cornerRadius = 40
        headerView.layer.masksToBounds = true
        infoView.layer.cornerRadius = 10
        infoView.layer.masksToBounds = true

        DolarAPI().makeRequest { (objetoDecodificado) in
            self.dolarLabel.text = "Dólar: \(objetoDecodificado.USDBRL.ask)"
        }
        

    }
    
    //MARK: IBOutlets
    

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var dolarLabel: UILabel!

    
        



    
}
