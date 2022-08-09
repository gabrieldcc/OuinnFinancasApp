//
//  HomeTableViewHeader.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 01/06/22.
//

import UIKit

class HomeTableViewHeader: UIView {
    
    
    @IBOutlet weak var selicLabel: UILabel!
    @IBOutlet weak var dolarLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var ibovespaLabel: UILabel!
    
    func configuraViewHeader() {
        
        //arrendondar view
        headerView.layer.cornerRadius = 10
        headerView.layer.masksToBounds = true
        
        infoView.layer.cornerRadius = 10
        infoView.layer.masksToBounds = true
        
        //setar valor nas labels
        DolarAPI().makeRequest {  (objetoDecodificado) in
            let dolar = NSString(string: objetoDecodificado.USDBRL.ask).doubleValue
            let display = String(format: "%.2f", dolar)
            
            DispatchQueue.main.async {
                self.dolarLabel.text = "Dólar: R$\(display)"
                self.ibovespaLabel.text =  "Ibovespa: 112.05"//"Ibovespa: \(ibovespa)"
                self.selicLabel.text =  "Selic: 12.1%" //"Selic: \(selic)"
            }
        }
        
        
        
        
        
        
    }
}

//}

