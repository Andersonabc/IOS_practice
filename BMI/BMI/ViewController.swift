//
//  ViewController.swift
//  BMI
//
//  Created by 李承紘 on 2021/3/3.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var
        height_Field: UITextField!
    @IBOutlet weak var
        weightField: UITextField!
    @IBOutlet weak var
        bmiField: UITextField!
    @IBOutlet weak var
        resultLabel: UILabel!

    @IBAction func Calculate(_ sender: Any) {
        //resultLabel.text = String("test")
        if (height_Field.text == nil && weightField.text == nil)
        {
            return
        }
        let h = Float(height_Field.text!)!/100.0
        let w = Float(weightField.text!)!
        let bmi = w/(h*h)
        bmiField.text = String(bmi)
        var result:String = "體重正常"
        if (bmi < 18.5){
            result = String("體重過輕")
        }else if (bmi > 30){
            result = String("體重過重")
        }
        resultLabel.text = result
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

