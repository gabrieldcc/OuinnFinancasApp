import Foundation

let dolar = "4.8005"

let dolarA = ("%.2f", dolar)

func formatResult(result: String) -> String{
    let resultDouble = Double(result)
    return String(format: "%.2f", resultDouble!)
    }


print(formatResult(result: "4.8006546545"))
