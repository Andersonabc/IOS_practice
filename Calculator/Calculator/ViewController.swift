//
//  ViewController.swift
//  Calculator
//
//  Created by 李承紘 on 2021/3/8.
//

import UIKit

class ViewController: UIViewController {
    
    var record:String = "";
    var result:Double = 0.0;
    let tagList = ["+","-","x","÷"]
    
    @IBOutlet weak var process_view: UILabel!
    @IBOutlet weak var result_view: UILabel!
    
    @IBAction func zero_btn(_ sender: UIButton) {
        record += "0"
        process_view.text = record
    }
    @IBAction func dot_btn(_ sender: Any) {
        record += "."
        process_view.text = record
    }
    @IBAction func one_btn(_ sender: Any) {
        record += "1"
        process_view.text = record
    }
    @IBAction func two_btn(_ sender: Any) {
        record += "2"
        process_view.text = record
    }
    @IBAction func three_btn(_ sender: Any) {
        record += "3"
        process_view.text = record
    }
    @IBAction func four_btn(_ sender: Any) {
        record += "4"
        process_view.text = record
    }
    @IBAction func five_btn(_ sender: Any) {
        record += "5"
        process_view.text = record
    }
    @IBAction func six_btn(_ sender: Any) {
        record += "6"
        process_view.text = record
    }
    @IBAction func seven_btn(_ sender: Any) {
        record += "7"
        process_view.text = record
    }
    @IBAction func eight_btn(_ sender: Any) {
        record += "8"
        process_view.text = record
    }
    @IBAction func nine_btn(_ sender: Any) {
        record += "9"
        process_view.text = record
    }
    @IBAction func plus_btn(_ sender: Any) {
        record += "+"
        process_view.text = record
    }
    @IBAction func minus_btn(_ sender: Any) {
        record += "-"
        process_view.text = record
    }
    @IBAction func times_btn(_ sender: Any) {
        record += "x"
        process_view.text = record
    }
    @IBAction func division_btn(_ sender: Any) {
        record += "÷"
        process_view.text = record
    }
    
    @IBAction func equal_btn(_ sender: Any) {
        record += "="
        process_view.text = record
        var strNumber: String = ""
        var arr: Array<Double> = []
        var symbol: Array<String> = []
        for temp in record{
            if(temp == "="){
                arr.append(Double(strNumber) ?? 0)
            }else if (tagList.contains(String(temp))){
                symbol.append(String(temp))
                arr.append(Double(strNumber) ?? 0)
                strNumber = ""
            }else{
                strNumber += String(temp)
            }}
        var ind: Int = 0
        while (symbol.contains(tagList[2]) || symbol.contains(tagList[3])){
            if(symbol[ind] == "x"){
                arr[ind] = arr[ind]*arr[ind+1]
                arr.remove(at: ind+1)
                symbol.remove(at: ind)
                ind = 0
            }else if(symbol[ind] == "÷"){
                arr[ind] = arr[ind]/arr[ind+1]
                arr.remove(at: ind+1)
                symbol.remove(at: ind)
                ind = 0
            }else{
                ind += 1
            }
            
        }
        result = arr[0]
        for (ind,sym) in symbol.enumerated(){
            if(sym == "+"){
                result += arr[ind+1]
            }else if(sym == "-"){
                result -= arr[ind+1]
            }
        }
        if(floor(result) == result){
            result_view.text = String(Int(result))
        }else{
            result_view.text = String(result)
        }
        
        
    }
    @IBAction func clean_btn(_ sender: Any) {
        record = "";
        result = 0;
        process_view.text = record
        if(floor(result) == result){
            result_view.text = String(Int(result))
        }else{
            result_view.text = String(result)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

