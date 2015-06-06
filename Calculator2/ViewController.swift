//
//  ViewController.swift
//  Calculator2
//
//  Created by Gelsy Cejudo Valencia on 05/06/15.
//  Copyright (c) 2015 Gelsy Cejudo Valencia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var display : UILabel!
    
    var userisenteringnumbers = false
    
    @IBAction func enternumber (sender: UIButton) {
        let digit = sender.currentTitle!
    
        if userisenteringnumbers {
           display.text = display.text! + digit
        } else {
            display.text = digit
            userisenteringnumbers = true
        }
    
    
      }
    
    var operandStank = Array<Double>()
    
    @IBAction func enter () {
        userisenteringnumbers = false
        
        operandStank.append(displayvalue)
        println("operandStack = \(operandStank)")
    }
    
    var displayvalue : Double {
        
        get {
            return NSNumberFormatter ().numberFromString(display.text!)!.doubleValue
        } set {
            display.text = "\(newValue)"
            
            userisenteringnumbers = false
        }
    }
    
    
    @IBAction func clear () {
        displayvalue = 0
        display.text = "\(displayvalue)"
    }
    
    @IBAction func operate (sender: UIButton) {
        let operation = sender.currentTitle!
        
        if userisenteringnumbers {
            enter()
        }
        
        switch operation {
            case "➕":performOperation {$0 + $1}
            case "➖":performOperation {$1 - $0}
            case "✖️":performOperation {$0 * $1}
            case "➗":performOperation {$1 / $0}
            case "✔️":performOperations {sqrt($0)}
            default: break
        }
        
        
    }
    func performOperation (operation: (Double, Double) -> Double) {
        if operandStank.count >= 2 {
            displayvalue = operation (operandStank.removeLast(), operandStank.removeLast())
            
            enter()
        }
    }
    
    func performOperations (operation: Double -> Double) {
        if operandStank.count >= 1 {
            displayvalue = operation (operandStank.removeLast())
            
            enter()
        }
    }
    
    
    func add (op1: Double, op2: Double) ->Double  {
        return op1 + op2
    }
    func subtract (op1: Double, op2: Double) ->Double  {
          return op1 - op2
    }
    func multiply (op1: Double, op2: Double) ->Double  {
        return op1 * op2
    }
    func divide (op1: Double, op2: Double) ->Double  {
        return op1 / op2
    }
}

