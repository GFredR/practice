//
//  CalculatorBrain.swift
//  CalculatorWithSwift
//
//  Created by 郭丰锐 on 2017/8/25.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

import Foundation



struct CalculatorBrain {
    private var accumulator: Double?
    private enum Oeration{
        case constant(Double)
        case unaryOperation((Double) ->Double)
        case binaryOperation((Double,Double) ->Double)
        case equals
    }
    private var operations :Dictionary<String,Oeration> = [
        "π" : Oeration.constant(Double.pi),
        "e" : Oeration.constant(M_E),
        "√" : Oeration.unaryOperation(sqrt),
        "cos" : Oeration.unaryOperation(cos),
        "±" : Oeration.unaryOperation({ -$0 }),
        "×" : Oeration.binaryOperation({ $0 * $1 }),
        "÷" : Oeration.binaryOperation({ $0 / $1 }),
        "+" : Oeration.binaryOperation({ $0 + $1 }),
        "−" : Oeration.binaryOperation({ $0 - $1 }),
        "=" : Oeration.equals
    ]
    mutating func performOperation(_ symbol: String){
        //performOperation("π")
        if let operation = operations[symbol]{
            //accumulator = constant
            switch operation {
            case .constant(let Value):
                accumulator = Value
                
            case .unaryOperation(let function):
                if accumulator != nil {
                    accumulator = function(accumulator!)
                }
            case.binaryOperation(let function):
                if accumulator != nil{
                    pendingBinaryOperation = PendingBinaryOperation(function: function, firstOperand: accumulator!)
                    accumulator = nil
                }
            case.equals:
                performpendingBinaryOperation()
            }
        }
        
    }
    private mutating func performpendingBinaryOperation(){
        if pendingBinaryOperation != nil && accumulator != nil{
            accumulator = pendingBinaryOperation!.perform(with: accumulator!)
            pendingBinaryOperation = nil
        }
    }
    private var pendingBinaryOperation: PendingBinaryOperation?
    private struct PendingBinaryOperation{
        let function: (Double,Double) ->Double
        let firstOperand: Double
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand,secondOperand)
        }
        
    }
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    var result : Double?{
        get{
            return accumulator
        }
    }
    
}
