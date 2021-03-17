//
//  ViewController.swift
//  cardGame
//
//  Created by 李承紘 on 2021/3/10.
//

import UIKit

class ViewController: UIViewController {
    


    var display:String = "FLIPs: "
    var current:Bool = false

    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCount: UILabel!
    var count:Int = 0{
        didSet{
            flipCount.text = "Flips: \(count)"
        }
    }
    
    //lazy: initialize when somebody use it. The trade-off will be we can not use "didset" in lazy variable
    lazy var game:MatchingGame = MatchingGame(numberOfPairsOfCards: (cardButtons.count+1)/2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var Emojis = ["🥵", "👾", "🤔", "🥱", "🥶", "🤯", "🤩", "😈"]
    @IBAction func touchCard(_ sender: UIButton) {

        count = count + 1
        
//        if let cardIndex = cardButtons.firstIndex(of: sender){
//
//            let emoji = Emojis[cardIndex]
//            if(sender.currentTitle == emoji){
//                sender.setTitle("",for: UIControl.State.normal)
//                sender.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//            }else{
//                sender.setTitle(emoji,for: UIControl.State.normal)
//                sender.backgroundColor = #colorLiteral(red: 0.6899590735, green: 1, blue: 0.7358576945, alpha: 1)
//            }
//            //sender.setTitle("",for: UIControl.State.normal)
//        }
        if let cardNumber = cardButtons.index(of: sender){
            print("cardNumber = \(String(describing: cardNumber))")
            
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("not in the collection")
        }
        
    }
    
    @IBAction func btn_Flip(_ sender: Any) {
        count = 0
        for button in cardButtons{
            if(current && button.currentTitle == ""){ button.sendActions(for: .touchUpInside)
            }else if (!current && button.currentTitle != ""){
                button.sendActions(for: .touchUpInside)
            }
        }
        current = !current;
        count = 0;
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(getEmoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0):#colorLiteral(red: 0.6899590735, green: 1, blue: 0.7358576945, alpha: 1)
            }
        }
    }
    
    func getEmoji(for card: Card) -> String{
        return "?"
    }
    

}
