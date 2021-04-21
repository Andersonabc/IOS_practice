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
var processView: String = ""
var skipOne: Bool = false

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
    
    func getNumber(at number:Double)->String{
        if(floor(number) == number){
            return String(Int(number))
        }else{
            return String(number)
        }
    }
    
    func run() -> String{
        var data:String = equ.getEqua();
        var strNumber: String = ""
        var arr: Array<Double> = []
        var symbol: Array<String> = []
        processView = ""
        print(data)
        for temp in data{
            if(temp == "="){
                if(skipOne){
                    processView +=  " = "
                    skipOne = false
                }else{
                    arr.append(Double(strNumber) ?? 0)
                    processView += (getNumber(at: Double(strNumber) ?? 0) + " = ")
                }
            }else if (tagList.contains(String(temp))){
                if(skipOne){
                    processView += String(temp)
                    symbol.append(String(temp))
                    skipOne = false
                }else{
                    processView += getNumber(at: Double(strNumber) ?? 0)
                    processView += String(temp)
                    symbol.append(String(temp))
                    arr.append(Double(strNumber) ?? 0)
                }
                strNumber = ""
            }else if(String(temp) == "@"){
                processView += ("±(" + (getNumber(at: Double(strNumber) ?? 0) + ")"))
                arr.append(0.0 - ((Double(strNumber) ?? 0)))
                skipOne = true
            }else{
                strNumber += String(temp)
            }
        }
        var ind: Int = 0
        while (symbol.contains(tagList[2]) || symbol.contains(tagList[3])){
            if(symbol[ind] == "x"){
                arr[ind] = arr[ind]*arr[ind+1]
                arr.remove(at: ind+1)
                symbol.remove(at: ind)
                ind = 0
            }else if(symbol[ind] == "÷"){
                if(arr[ind+1] == 0.0){
                    return "0"
                }
                arr[ind] = arr[ind]/arr[ind+1]
                arr.remove(at: ind+1)
                symbol.remove(at: ind)
                ind = 0
            }else{
                ind += 1
            }
            
        }
        print(ind)
        print(arr)
        result = arr[0]
        for (ind,sym) in symbol.enumerated(){
            if(sym == "+"){
                result += arr[ind+1]
            }else if(sym == "-"){
                result -= arr[ind+1]
            }
        }
    return processView
    }
    
    func reset(){
        equ.reset()
        result = 0.0
        processView = ""
        skipOne = false
    }
    
    func getProcess()->String{
        return processView;
    }
    
    func modifyEquation(){
        equ.removeTail()
    }
    
}


