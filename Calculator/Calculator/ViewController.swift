//
//  ViewController.swift
//  Calculator
//
//  Created by 李承紘 on 2021/3/8.
//

import UIKit

class ViewController: UIViewController {
    
    let operatorList = ["+","-","x","÷","@","%"]
    var buff:String = ""
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var process_view: UILabel!
    @IBOutlet weak var result_view: UILabel!
    var calculator:Calculator = Calculator()
    var instructions = ["0","1","2","3","4","5","6","7","8","9",".","+","-","x","÷","@","%"]
    var isDot:Bool = false
    var disabled:Bool = false
    var record:String = ""{
        didSet{
            process_view.text = record
        }
    }

    @IBAction func touchNumber(_ sender: UIButton) {
        if let Number = buttons.firstIndex(of: sender){
            if(instructions[Number] == "." && isDot){
                print("dot again")
            }else if (operatorList.contains(buff) && operatorList.contains(instructions[Number])){
                buff = instructions[Number]
                calculator.modifyEquation()
                if(instructions[Number] != "@"){
                    record.removeLast()
                    record += instructions[Number]
                }
                calculator.touchButton(at: instructions[Number])
            }else{
                buff = instructions[Number]
                if(instructions[Number] != "@"){
                    record += instructions[Number]
                }
                if(operatorList.contains(buff)){
                    isDot = false
                }
                if(buff == "."){
                    isDot = true
                }
                calculator.touchButton(at: instructions[Number])
            }

        }
    }
    
    @IBAction func equal_btn(_ sender: Any) {
        if(!disabled){
            calculator.touchButton(at: "=")
            record = calculator.run()
            result_view.text = calculator.getResult()
            disabled = true
        }
    }
    @IBAction func clean_btn(_ sender: Any) {
        calculator.reset()
        record = ""
        process_view.text = "0"
        buff = ""
        result_view.text = calculator.getResult()
        isDot = false
        disabled = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

