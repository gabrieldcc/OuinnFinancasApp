//
//  GastosFixos.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 06/06/22.
//

import UIKit


class GastosFixos: NSObject {
        
    var tipoDeGastoFixo: String
    var valorGastoFixo: String

    init(tipoDeGastoFixo: String, valorGastoFixo: String) {
        self.tipoDeGastoFixo = tipoDeGastoFixo
        self.valorGastoFixo = valorGastoFixo
    
    }
    
}


