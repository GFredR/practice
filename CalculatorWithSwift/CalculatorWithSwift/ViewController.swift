//
//  ViewController.swift
//  CalculatorWithSwift
//
//  Created by 郭丰锐 on 2017/8/24.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    var userIsInTheMiddleOfTyping: Bool = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
      //  drawLine(from: 5.0, to: 8.5, using: UIColor.blue)
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping{
        //print("\(digit) was touch")
            let textCurrentlyInDisplay = display!.text!
            display.text = textCurrentlyInDisplay + digit
        }else{
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    var displayValue:Double{
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    private var brain : CalculatorBrain = CalculatorBrain()
    @IBAction func performOpretaion(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping{
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathmaticSymbol = sender.currentTitle{
            brain.performOperation(mathmaticSymbol)
        }//
        if let result = brain.result{
            displayValue = result
        }
        
    }
    
   // func drawLine(from startX:Double, to endX:Double, using color:UIColor){
    
    //}


}

