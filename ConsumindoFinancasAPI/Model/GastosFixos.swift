//
//  GastosFixos.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 06/06/22.
//

import UIKit


class GastosFixos: NSObject, NSCoding {
    
    //MARK: - Vars
    var tipoDeGastoFixo: String
    var valorGastoFixo: Double

    init(tipoDeGastoFixo: String, valorGastoFixo: Double) {
        self.tipoDeGastoFixo = tipoDeGastoFixo
        self.valorGastoFixo = valorGastoFixo
        
    }
    
    //MARK: NSCoding
    func encode(with coder: NSCoder) {
        coder.encode(tipoDeGastoFixo, forKey: "tipoDeGastoFixo")
        coder.encode(valorGastoFixo, forKey: "valorGastoFixo")
    }
    
    required init?(coder: NSCoder) {
        tipoDeGastoFixo = coder.decodeObject(forKey: "tipoDeGastoFixo") as! String
        valorGastoFixo = coder.decodeDouble(forKey: "valorGastoFixo")
    }
        
    }
    



