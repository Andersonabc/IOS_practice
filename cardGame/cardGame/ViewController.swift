//
//  ViewController.swift
//  cardGame
//
//  Created by 李承紘 on 2021/3/10.
//

import UIKit

class ViewController: UIViewController {

    var count:Int = 0
    var display:String = "FLIPs: "
    var current:Bool = false

    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCount: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var Emojis = ["🥵", "👾", "🤔", "🥱", "🥶", "🤯", "🤩", "😈"]
    @IBAction func touchCard(_ sender: UIButton) {

        count = count + 1
        flipCount.text = display + String(count)
        
        if let cardIndex = cardButtons.firstIndex(of: sender){
        
            let emoji = Emojis[cardIndex]
            if(sender.currentTitle == emoji){
                sender.setTitle("",for: UIControl.State.normal)
                sender.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            }else{
                sender.setTitle(emoji,for: UIControl.State.normal)
                sender.backgroundColor = #colorLiteral(red: 0.6899590735, green: 1, blue: 0.7358576945, alpha: 1)
            }
            //sender.setTitle("",for: UIControl.State.normal)
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
        self.flipCount.text = display + String(count);
    }
}
