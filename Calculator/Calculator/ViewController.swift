//
//  ViewController.swift
//  Calculator
//
//  Created by 李承紘 on 2021/3/8.
//

import UIKit

class ViewController: UIViewController {
    
    var record:String = "";
    let tagList = ["+","-","x","÷"]
    var buff:String = ""
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var process_view: UILabel!
    @IBOutlet weak var result_view: UILabel!
    var calculator:Calculator = Calculator()
    var instructions = ["0","1","2","3","4","5","6","7","8","9",".","+","-","x","÷","@"]
    
    var process:String = ""{
        didSet{
            process_view.text = process
        }
    }

    @IBAction func touchNumber(_ sender: UIButton) {
        if let Number = buttons.firstIndex(of: sender){
            if(buff == "." && instructions[Number] == "."){
                print("dot again")
            }else if (tagList.contains(buff) && tagList.contains(instructions[Number])){
                buff = instructions[Number]
                calculator.modifyEquation()
                record.removeLast()
                record += instructions[Number]
                process = record
                calculator.touchButton(at: instructions[Number])
            }else{
                buff = instructions[Number]
                record += instructions[Number]
                process = record
                calculator.touchButton(at: instructions[Number])
            }

        }
    }
    
    @IBAction func equal_btn(_ sender: Any) {
        calculator.touchButton(at: "=")
        process = calculator.run()
        result_view.text = calculator.getResult()
    }
    @IBAction func clean_btn(_ sender: Any) {
        calculator.reset()
        process = ""
        record = ""
        result_view.text = calculator.getResult()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

