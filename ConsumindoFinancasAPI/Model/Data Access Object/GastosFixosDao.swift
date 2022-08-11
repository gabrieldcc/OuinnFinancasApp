//
//  UIViewController+.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 10/08/22.
//

import Foundation

class GastosFixosDao {
    
    func archiveData(gastosFixos: [GastosFixos]) {
        let caminho = recoverPath()
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: gastosFixos, requiringSecureCoding: false)
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func recoverPath() -> URL {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return URL(fileURLWithPath: String()) }
            let caminho = diretorio.appendingPathComponent("GastoFixo")
            return caminho
        }
    
    func recoverData() -> [GastosFixos] {
        let caminho = recoverPath()
        do {
            let dados = try Data(contentsOf: caminho)
             guard let gastosSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? [GastosFixos] else { return [] }
            return gastosSalvos
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
}



