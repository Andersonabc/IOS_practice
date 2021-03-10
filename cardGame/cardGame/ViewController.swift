//
//  ViewController.swift
//  cardGame
//
//  Created by 李承紘 on 2021/3/10.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var cardButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var Emojis = ["🥵", "👾"]
    @IBAction func touchCard(_ sender: UIButton) {

        
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
    



}

