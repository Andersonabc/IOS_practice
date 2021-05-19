//
//  GameViewModel.swift
//  practice_MVVM
//
//  Created by 李承紘 on 2021/5/19.
//

import Foundation

class GameViewModel: ObservableObject{
    @Published var playerPlay: player?
    @Published var computerPlay: player?
    @Published var result: GameResult?
    
    var plays: [player] = {
        var plays = [player]()
        for i in player.Plays.allCases{
            let j = player(play: i)
            plays.append(j)
        }
        return plays
    }()

    func action(){
        plays.shuffle()
        playerPlay = plays[0]
        computerPlay = plays[1]
        result = checkResult()
    }
    
    func checkResult() -> GameResult{
        let playRankIndex = player.Plays.allCases.firstIndex(of: playerPlay!.play)!
        let computerRankIndex = player.Plays.allCases.firstIndex(of: computerPlay!.play)!
        if playRankIndex == 0{
            if computerRankIndex == 0{
                return .tie
            }else if computerRankIndex == 1{
                return .win
            }else{
                return .lose
            }
        }else if playRankIndex == 1{
            if computerRankIndex == 0{
                return .lose
            }else if computerRankIndex == 1{
                return .tie
            }else{
                return .win
            }
        }else{
            if computerRankIndex == 0{
                return .win
            }else if computerRankIndex == 1{
                return .lose
            }else{
                return .tie
            }
        }
    }
}

