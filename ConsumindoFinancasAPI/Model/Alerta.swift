//
//  Alerta.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 13/06/22.
//

import UIKit

class Alerta {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(title: String = "Atenção", message: String, handler: @escaping (UIAlertAction) -> Void) {
        
        let alerta = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let buttonOk = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        let buttonDelete = UIAlertAction(title: "Deletar", style: .destructive, handler: handler)
        alerta.addAction(buttonOk)
        alerta.addAction(buttonDelete)
        controller.present(alerta, animated:  true, completion: nil)
    }
}
