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

        makeRequest { (objetoDecodificado) in
            self.dolarLabel.text = "Dólar: \(objetoDecodificado.USDBRL.ask)"
        }
        

    }
    
    //MARK: IBOutlets
    

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var dolarLabel: UILabel!

    
        


struct apiDolar: Codable {

    var USDBRL: Dolar

}

struct  Dolar: Codable {
    var ask: String
}



    func makeRequest(completion: @escaping(apiDolar) -> ())  {
    let url = URL(string: "https://economia.awesomeapi.com.br/json/last/USD-BRL")!
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        
        print("response: \(String(describing: response))")
        print("error: \(String(describing: error))")
        
        guard let responseData = data else {return}
        DispatchQueue.main.async {
        do {
             let objetoDecodificado = try JSONDecoder().decode(apiDolar.self, from: responseData)
            //print("dolar:\(objetoDecodificado.USDBRL)")
            completion(objetoDecodificado)
            print(objetoDecodificado.USDBRL.ask)
        } catch let error{
            print("error\(error)")
        }
    }
    }
    task.resume()
}
    
    
    
}
