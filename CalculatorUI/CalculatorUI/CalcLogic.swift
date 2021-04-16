//
//  CalcLogic.swift
//  CalculatorUI
//
//  Created by Derrick kim on 2021/04/15.
//

import Foundation


class CalcLogic {
    
    var digit1: Double? = nil
    var digit2: Double? = nil
    
    var calculationResult: Double? = nil
    var remeberSymbol : String? = nil
    
    func calcLogic() -> Double? {
        
        switch remeberSymbol {
        case "+":
            calculationResult = digit1! + digit2!
        case "-":
            calculationResult = digit1! - digit2!
        case "+-":
            calculationResult = digit1! * -1
        case "x":
            calculationResult = digit1! * digit2!
        case "÷":
            calculationResult = digit1! / digit2!
        case "%":
            calculationResult = digit1! * 0.01
        
            
        default:
            
            break
        }
        return calculationResult
    }
    
    
}
