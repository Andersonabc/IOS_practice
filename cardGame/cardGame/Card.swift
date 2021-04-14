//
//  Card.swift
//  cardGame
//
//  Created by 李承紘 on 2021/3/17.
//

import Foundation

struct Card:Hashable{
    static var identifierFactory = 0
    var isFaceUp = false
    var isMatched = false
    private var Identifier:Int    //use ID, not emoji

    static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.Identifier = Card.getUniqueIdentifier()
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(Identifier)
    }
    static func == (lhs: Card, rhs: Card) -> Bool{
        return lhs.Identifier == rhs.Identifier
    }
    

}
