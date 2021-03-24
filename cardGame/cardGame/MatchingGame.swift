//
//  MatchingGame.swift
//  cardGame
//
//  Created by 李承紘 on 2021/3/17.
//

import Foundation

class MatchingGame{
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    var cards: Array<Card> = Array()
    var current:Bool = false
    //var cards: [Card] = [Card]()
    //var cards: [Card] = []
    //var cards: = [Card]()
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex].Identifier == cards[index].Identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex == index{
                cards[index].isFaceUp = false
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                for flipDownIndex in cards.indices{
                    if !cards[flipDownIndex].isMatched {
                        cards[flipDownIndex].isFaceUp = false
                        
                    }
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    func flipAllCard(){
        for ind in cards.indices{
            if(current && cards[ind].isFaceUp){ cards[ind].isFaceUp = !cards[ind].isFaceUp
            }else if (!current && !cards[ind].isFaceUp){
                cards[ind].isFaceUp = !cards[ind].isFaceUp
            }
        }
        current = !current;

    }
    func resetAllCard(){
        cards.shuffle()
        for ind in cards.indices{
            cards[ind].isFaceUp = false
            cards[ind].isMatched = false
        }
    }

    init(numberOfPairsOfCards: Int){
        //if 沒有自定義 init
        //let card = Card(isFaceUp: false, isMatched: false, Identifier: 0)
        //strct 一定要init (default init method)
        //class可不init default為nill
        //也可以自定義init
        for _ in 1...numberOfPairsOfCards{
            //let card = Card(identifier: identifier)
            //cards.append(card)
            //let matchingCard = Card(identifier: identifier)
            //cards.append(matchingCard)
            //can be simplified as(because struct is pass by value) using cards.append(card) again
            //cards.append(card)
            //cards.appen(card) can simplfied as cards += [card, card]
            //In order to avoid setting id everytime change the init func of card, create a static variable and hava a new getID func. Also, we dont neet i in the for loop, so make it to a underline
            let card = Card()
            //cards.append(card)
            cards += [card,card]
        cards.shuffle()
            
        }
        
    }
    
    
}
