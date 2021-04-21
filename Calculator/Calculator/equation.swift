//
//  equation.swift
//  Calculator
//
//  Created by 李承紘 on 2021/4/21.
//

import Foundation
class  equation{
    private var record:String
    
    init(){
        self.record = ""
    }
    
    func add(at input: String){
        record += input
    }
    
    func removeTail(){
        record.removeLast()
    }
    
    func getEqua()->String{
        return self.record
    }
    
    func reset(){
        self.record = ""
    }
}



