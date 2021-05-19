//
//  player.swift
//  practice_MVVM
//
//  Created by 李承紘 on 2021/5/19.
//

import Foundation
struct player{
    let play: Plays

    enum Plays: String, CaseIterable{
        case paper = "布"
        case rock = "石頭"
        case scissor = "剪刀"
        
    }
}
