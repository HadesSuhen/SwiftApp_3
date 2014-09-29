//
//  ViewController.swift
//  SwiftApp_3
//
//  Created by lifei zhen on 14-9-24.
//  Copyright (c) 2014年 jffdfdf.cn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var labelResult: UILabel!
    
    var operand1: String = ""
    var operand2: String = ""
    var myoperator: String = ""
    var result = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    @IBAction func didClicked(sender : UIButton) {
        let value = sender.currentTitle
        if(value == "C")
        {
            labelResult.text = "0"
            myoperator = ""
            operand1 = ""
            operand2 = ""
            result = 0
            return
        }
        
        if (value == "+" || value == "-" || value == "x" || value == "/"){
            myoperator = value!
            if(operand2 != ""){
                if(value == "+"){
                    result = result + operand2.toInt()!
                    labelResult.text = "\(result)"
                    println("+:\(operand1) \(myoperator) \(operand2) \(result)")
                    operand2 = ""
                }else if(value == "-"){
                    result = result - operand2.toInt()!
                    labelResult.text = "\(result)"
                    println("-:\(operand1) \(myoperator) \(operand2) \(result)")
                    operand2 = ""
                }else if(value == "x"){
                    result = result * operand2.toInt()!
                    labelResult.text = "\(result)"
                    println("*:\(operand1) \(myoperator) \(operand2) \(result)")
                    operand2 = ""
                }else if(value == "/"){
                    if(operand2.toInt()! == 0)
                    {
                        labelResult.text = "error"
                        myoperator = ""
                        operand1 = ""
                        operand2 = ""
                        return
                    }
                    result = result / operand2.toInt()!
                    labelResult.text = "\(result)"
                    println("/:\(operand1) \(myoperator) \(operand2) \(result)")
                    operand2 = ""
                }
            }
            println("myoperator /:\(operand1) \(myoperator) \(operand2) \(result)")
            return
        }else if (value == "=" && operand2 != ""){
            
            switch myoperator{
                case "+":
                    result = result + operand2.toInt()!
                    println("case +:\(operand1) \(myoperator) \(operand2) \(result)")
                case "-":
                    result = result - operand2.toInt()!
                    println("case -:\(operand1) \(myoperator) \(operand2) \(result)")
                case "x":
                    result = result * operand2.toInt()!
                    println("case x:\(operand1) \(myoperator) \(operand2) \(result)")
                case "/":
                    if(operand2.toInt()! == 0)
                    {
                        labelResult.text = "error"
                        myoperator = ""
                        operand1 = ""
                        operand2 = ""
                        return
                    }
                    result = result / operand2.toInt()!
                    println("case /:\(operand1) \(myoperator) \(operand2) \(result)")
                default:
                    result = 0
            }
            
            labelResult.text = "\(result)"
            
            myoperator = ""
            operand1 = ""
            operand2 = ""
            
            return
        }else if (value == "=" &&  operand2 == ""){
            labelResult.text = "\(result)"
            println("= /:\(operand1) \(myoperator) \(operand2) \(result)")
            myoperator = ""
            operand1 = ""
            operand2 = ""
            return
        }
        if (myoperator == ""){
            if((operand1 + value!).toInt() <= 99999999){
                operand1 = operand1 + value!
                labelResult.text = operand1
                result = operand1.toInt()!
                println("operand1 /:\(operand1) \(myoperator) \(operand2) \(result)")
            }
        }else if (myoperator != ""){
            if((operand2 + value!).toInt()! <= 99999999){
                operand2 = operand2 + value!
                labelResult.text = operand2
                println("operand2 /:\(operand1) \(myoperator) \(operand2) \(result)")
            }
        }
    }
}

