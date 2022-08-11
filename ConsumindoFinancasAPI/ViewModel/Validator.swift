//
//  Validator.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 11/08/22.
//

class Validator {
    
    func validateEmail(textField: String) -> Bool {
        guard let atIndex = textField.firstIndex(of: "@") else {
            return false
        }
        let emailHasDot = textField.contains(".")
        let emailHasAt = textField.contains("@")
        let emailIsHigherOrEqualToFive = textField.count >= 5
        let substring = textField[atIndex...]
        let substringHasDot = substring.contains(".")
        
        if  emailHasDot &&
            emailHasAt &&
            emailIsHigherOrEqualToFive &&
            substringHasDot {
            
            return true
        } else {
            return false
        }
    }
    
}
