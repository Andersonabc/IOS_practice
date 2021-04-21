//
//  Calculator.swift
//  Calculator
//
//  Created by 李承紘 on 2021/4/21.
//

import Foundation
var result:Double = 0.0
let tagList = ["+","-","x","÷"]
var equ: equation = equation()
class Calculator{
    func touchButton(at arg:String){
        equ.add(at: arg)
    }
    func getResult()->String{
        if(floor(result) == result){
            return String(Int(result))
        }else{
            return String(result)
        }
    }
    func run(){
        var data:String = equ.getEqua();
        var strNumber: String = ""
        var arr: Array<Double> = []
        var symbol: Array<String> = []
        for temp in data{
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
    }
    
    func reset(){
        equ.reset()
        result = 0.0
    }
    
    
}


