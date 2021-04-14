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
    @IBOutlet weak var pointCount: UILabel!
    var point:Int = 0{
        didSet{
            pointCount.text = "You got: \(point) points!"
        }
    }
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
        
        if let cardNumber = cardButtons.firstIndex(of: sender){
            print("cardNumber = \(String(describing: cardNumber))")
            if(!game.getCard(at: cardNumber).isMatched){
                count = count + 1
            }
            point += game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("not in the collection")
        }
        
        
    }
    @IBAction func btn_Flip(_ sender: Any) {
        game.flipAllCard()
        updateViewFromModel()
    }
    @IBAction func btn_reset(_ sender: Any) {
        game.resetAllCard()
        updateViewFromModel()
        count = 0
        point = 0
    }
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.6896845102, green: 0.989905417, blue: 0.736236155, alpha: 0.5):#colorLiteral(red: 0.6899590735, green: 1, blue: 0.7358576945, alpha: 1)
            }else{
                if(!card.isMatched){
                    button.setTitle("", for: UIControl.State.normal)
                    button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                }
            }
        }
    }
    
//    func getEmoji(for card: Card) -> String{
//        return Emojis[card.Identifier-1]
//    }
    
    
    //var emojiDic:Dictionary<Int,String> = Dictionary<Int,String>()
    //var emojiDic = Dictionary<Int,String>()
    var emojiDic = [Card:String]()
    func emoji(for card: Card) -> String{
        if emojiDic[card] == nil, Emojis.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(Emojis.count)))
            emojiDic[card] = Emojis.remove(at: randomIndex)
        }
        return emojiDic[card] ?? "?"
    }

}
