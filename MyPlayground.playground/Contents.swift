import UIKit
//
// class Pessoas {
//
//    var altura: Double
//    var nome: String
//    var idade: Int
//
//
//init(nome: String, altura: Double, idade: Int) {
//    self.nome = nome
//    self.altura = altura
//    self.idade = idade
//}
//}
//    let gabriel = Pessoas(nome: "Gabriel", altura: 1.75, idade: 23)
//
//print(gabriel.nome)
//
//
//    class Medico: Pessoas {
//        var formado: Bool
//        var anosDeProfissao: Int
//        var especializacao: Bool
//
//        init(nome: String,altura: Double, idade: Int, formado: Bool, anosDeProfissao: Int, especializacao: Bool) {
//            self.formado = formado
//            self.anosDeProfissao = anosDeProfissao
//            self.especializacao = especializacao
//
//            super.init(nome: nome, altura: altura, idade: idade)
//        }
//}
//
//let pessoa2:Medico = Medico(nome: "Gabriel", altura: 1.75, idade: 40, formado: true, anosDeProfissao: 5, especializacao: true)
//
//print(pessoa2)
//
//
//
//struct Dolar: Codable {
//  var codein: String
//  var name: String
//    var low: String
//    var varBird: String
//    var high: String
//
//}

func makeRequest() {
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        
        print("response: \(String(describing: response))")
        print("error: \(String(describing: error))")
    }
    task.resume()
}
    makeRequest()

//
//let json = "https://economia.awesomeapi.com.br/last/USD-BRL".data(using: .utf8!)
//let decoder = JSONDecoder()
//let dolar =  try! decoder.decode(Dolar.self, from: json)
//
//
////let dado = Data(json.utf8)
////
////let decoder = JSONDecoder()
////do {
////    let objetoDecodificado = try decoder.decode(Dolar.self, from: dado)
////    print(objetoDecodificado)
////} catch {
////    print("não foi possível decodificar o json")
////}
//
//
//func fetchFilms(completionHandler: @escaping ([Dolar]) -> Void) {
//    let url = URL(string: "https://economia.awesomeapi.com.br/last/USD-BRL")
//
//    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
//      if let error = error {
//        print("Error with fetching films: \(error)")
//        return
//      }
//
//      guard let httpResponse = response as? HTTPURLResponse,
//            (200...299).contains(httpResponse.statusCode) else {
//        print("Error with the response, unexpected status code: \(response)")
//        return
//      }
//
//      if let data = data,
//        let filmSummary = try? JSONDecoder().decode(FilmSummary.self, from: data) {
//        completionHandler(filmSummary.results ?? [])
//      }
//    })
//    task.resume()
//  }
//fetchFilms { [Dolar] in
//    print(Dolar)
//}
