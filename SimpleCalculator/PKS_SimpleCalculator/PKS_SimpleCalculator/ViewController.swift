//
//  ViewController.swift
//  PKS_SimpleCalculator
//
//  Created by Péter Kulcsár Szabó on 23/10/2018.
//  Copyright © 2018 Péter Kulcsár Szabó. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var operation : String = ""
    var firstNumber : Decimal = 0
    var secondNumber : Decimal = 0
    var firstNumberAsString : String = ""
    var secondNumberAsString : String = ""

    @IBAction func numberPressed(_ sender: UIButton) {
        if let digit = sender.currentTitle {
            if operation == "" {
                if firstNumberAsString == "0" {
                    firstNumberAsString = digit
                }
                else
                {
                    firstNumberAsString += digit
                }
                displayLabel.text = firstNumberAsString
            }
            else
            {
                if secondNumberAsString == "0" {
                    secondNumberAsString = digit
                }
                else
                {
                    secondNumberAsString += digit
                }
                displayLabel.text = secondNumberAsString
            }
        }
    }
    
    @IBAction func clearAll(_ sender: Any) {
        firstNumber = 0
        operation = ""
        firstNumberAsString = "0"
        secondNumberAsString = ""
        displayLabel.text = "0"
    }
    
    @IBAction func addDecimalPoint(_ sender: Any) {
        if displayLabel.text == firstNumberAsString {
            if firstNumberAsString.contains(",") == false {
                firstNumberAsString += ","
            }
            displayLabel.text = firstNumberAsString.replacingOccurrences(of: ".", with: ",")
        }
        else
        {
            if secondNumberAsString.contains(",") == false {
                secondNumberAsString += ","
            }
            displayLabel.text = secondNumberAsString.replacingOccurrences(of: ".", with: ",")
        }
    }
    
    
    @IBAction func changeOrientation(_ sender: Any) {
        if displayLabel.text == firstNumberAsString.replacingOccurrences(of: ".", with: ",") {
            if(firstNumberAsString.contains("-") == true) {
                firstNumberAsString.removeFirst()
            }
            else{
                firstNumberAsString = "-" + firstNumberAsString
            }
            displayLabel.text = firstNumberAsString.replacingOccurrences(of: ".", with: ",")
        }
        else
        {
            if(secondNumberAsString.contains("-") == true) {
                secondNumberAsString.removeFirst()
            }
            else{
                secondNumberAsString = "-" + secondNumberAsString
            }
            displayLabel.text = secondNumberAsString.replacingOccurrences(of: ".", with: ",")
        }
    }
    
    
    @IBAction func additionPressed(_ sender: Any) {
        if firstNumberAsString == "" {
            firstNumberAsString = displayLabel.text!
        }
        
        if secondNumberAsString == "" {
            operation = "+"
            return 
        }
        
        doMath()
        operation = "+"
    }
    
    func doMath(){
        firstNumber = Decimal(string : firstNumberAsString.replacingOccurrences(of: ",", with: ".")) ?? 0
        
        secondNumber = Decimal(string : secondNumberAsString.replacingOccurrences(of: ",", with: ".")) ?? 0
        
        var result : Decimal = 0
        
        if operation == "+" {
            result = firstNumber + secondNumber
        }
        
        if operation == "-" {
            result = firstNumber - secondNumber
        }
        
        if operation == "*" {
            result = firstNumber * secondNumber
        }
        
        if operation == "/" {
            if secondNumber != 0 {
                result = firstNumber / secondNumber
            }
        }
        
        firstNumberAsString = String(describing : result)
        displayLabel.text = firstNumberAsString.replacingOccurrences(of: ".", with: ",")
        secondNumberAsString = ""
        operation = ""
    }
    
    @IBAction func minusPressed(_ sender: Any) {
        if firstNumberAsString == "" {
            firstNumberAsString = displayLabel.text!
        }
        
        if secondNumberAsString == "" {
            operation = "-"
            return
        }
        
        doMath()
        operation = "-"
    }
    
    @IBAction func multiplyPressed(_ sender: Any) {
        if firstNumberAsString == "" {
            firstNumberAsString = displayLabel.text!
        }
        
        if secondNumberAsString == "" {
            operation = "*"
            return
        }
        
        doMath()
        operation = "*"
    }
    
    @IBAction func dividePressed(_ sender: Any) {
        if firstNumberAsString == "" {
            firstNumberAsString = displayLabel.text!
        }
        
        if secondNumberAsString == "" {
            operation = "/"
            return
        }
        
        doMath()
        operation = "/"
    }
    
    @IBAction func percetntPressed(_ sender: Any) {
        if displayLabel.text == firstNumberAsString.replacingOccurrences(of: ".", with: ",") {
            
            firstNumberAsString = String(describing: ((Decimal(string: firstNumberAsString) ?? 0) / 100))
            displayLabel.text = firstNumberAsString.replacingOccurrences(of: ".", with: ",")
            
        }
        else
        {
            secondNumberAsString = String(describing: ((Decimal(string: secondNumberAsString) ?? 0) / 100))
            displayLabel.text = secondNumberAsString.replacingOccurrences(of: ".", with: ",")
        }
        
    }
    
    @IBAction func equationPressed(_ sender: Any) {
        if operation == "" {
            return
        }
        
        doMath()
        
        //firstNumberAsString = ""
        
    }
}

