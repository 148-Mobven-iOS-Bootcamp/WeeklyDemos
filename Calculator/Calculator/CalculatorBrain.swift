//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Semih Emre ÜNLÜ on 26.12.2021.
//

import Foundation

class CalculatorBrain {
    
    private var accumulator: Double = 0.0
    var result: Double {
        get {
            return accumulator
        }
    }
    
    // MARK: Manage operation type struct
    
    struct MathematicalOperations {
        var firstValue: Double // take the first accumulator int
        var binaryFunction: (Double,Double) -> Double // set 4 operation
        var operation: String // use "CE" operation
    }
    
    private var operationType: MathematicalOperations?
    
    func performOperation(_ operation: String?) {
        guard let operation = operation else { return }
        switch operation {
        case "√":
            accumulator = sqrt(result)
        case "/":
            equal()
            operationType = MathematicalOperations(firstValue: accumulator,
                                                   binaryFunction: division(value1:value2:),
                                                   operation: "/")
        case "*":
            equal()
            operationType = MathematicalOperations(firstValue: accumulator,
                                                   binaryFunction: multiply(value1:value2:),
                                                   operation: "*")
        case "-":
            equal()
            operationType = MathematicalOperations(firstValue: accumulator,
                                                   binaryFunction: minus(value1:value2:),
                                                   operation: "-")
        case "+":
            equal()
            operationType = MathematicalOperations(firstValue: accumulator,
                                                   binaryFunction: sum(value1:value2:),
                                                   operation: "+")
        case "=":
            equal()
        case "CE":
            if operationType != nil{
                switch operationType?.operation {
                    case "-","+":
                        accumulator = 0.0
                    case "/","*":
                        accumulator = 1.0
                    default:
                        break
                }
                accumulator = operationType!.binaryFunction(operationType!.firstValue, accumulator)
                operationType = nil
            }
        case "C":
            accumulator = 0.0
        default:
            break
        }
    }

    func setOperand(_ value: Double) {
        accumulator = value
    }
    
    // MARK: 4 operation functions
    
    func sum(value1: Double, value2: Double) -> Double{
        return value1 + value2
    }
    func minus(value1: Double, value2: Double) -> Double{
        return value1 - value2
    }
    func division(value1: Double, value2: Double) -> Double{
        return value1 / value2
    }
    func multiply(value1: Double, value2: Double) -> Double{
        return value1 * value2
    }
    
    // MARK: Equal Function
    
    func equal(){
        if operationType != nil{
            accumulator = operationType!.binaryFunction(operationType!.firstValue, accumulator)
            operationType = nil
        }
    }
}
