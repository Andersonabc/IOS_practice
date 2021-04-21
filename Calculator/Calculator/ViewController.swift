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
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var process_view: UILabel!
    @IBOutlet weak var result_view: UILabel!
    var calculator:Calculator = Calculator()
    var instructions = ["0","1","2","3","4","5","6","7","8","9",".","+","-","x","÷","@"]
    

    @IBAction func touchNumber(_ sender: UIButton) {
        if let Number = buttons.firstIndex(of: sender){
            record += instructions[Number]
            process_view.text = record
            calculator.touchButton(at: instructions[Number])
        }
    }
    
    @IBAction func equal_btn(_ sender: Any) {
        record += "="
        process_view.text = record
        calculator.touchButton(at: "=")
        calculator.run()
        result_view.text = calculator.getResult()
    }
    @IBAction func clean_btn(_ sender: Any) {
        calculator.reset()
        record = ""
        process_view.text = record
        result_view.text = calculator.getResult()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

