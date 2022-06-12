


struct GastosFixosPG {
    var tipoDeGasto: String
    var valorGasto: Double
}
    var gastosFixosArray: [GastosFixosPG] = []
    var gastoFixo1 = GastosFixosPG(tipoDeGasto: "aluguel", valorGasto: 1200)
    var gastoFixo2 = GastosFixosPG(tipoDeGasto: "financiamento", valorGasto: 1500)
    var gastoFixo3 = GastosFixosPG(tipoDeGasto: "educacao", valorGasto: 600)


    gastosFixosArray.append(gastoFixo1)
    gastosFixosArray.append(gastoFixo2)
    gastosFixosArray.append(gastoFixo3)
    gastosFixosArray.count



func somaValorGasto() -> Double {
    var total = 0.0
    for valor in gastosFixosArray {
        total += valor.valorGasto
    }
    return total
}

somaValorGasto()











