//
//  DolarAPI.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 01/06/22.
//

import UIKit

class DolarAPI {
    
    struct apiDolar: Codable {
        var USDBRL: Dolar
    }
    
    struct  Dolar: Codable {
        var ask: String
    }
    
    
    func makeRequest(completion: @escaping(apiDolar) -> ())  {
        let url = URL(string: "https://economia.awesomeapi.com.br/json/last/USD-BRL")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            print("error: \(String(describing: error))")
            
            guard let responseData = data else {return}
            do {
                let objetoDecodificado = try JSONDecoder().decode(apiDolar.self, from: responseData)
                completion(objetoDecodificado)
            } catch let error{
                print("error\(error)")
            }
        }
        task.resume()
    }
}

