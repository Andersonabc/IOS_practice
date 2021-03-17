//
//  Card.swift
//  cardGame
//
//  Created by 李承紘 on 2021/3/17.
//

import Foundation

struct Card{
    static var identifierFactory = 0
    var isFaceUp = false
    var isMatched = false
    var Identifier:Int    //use ID, not emoji

    static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.Identifier = Card.getUniqueIdentifier()
    }

}
