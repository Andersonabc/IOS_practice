//
//  ContentView.swift
//  practice_MVVM
//
//  Created by 李承紘 on 2021/5/19.
//

import SwiftUI

struct ContentView: View {
    @StateObject var gameViewModel = GameViewModel()
    
    var body: some View {
        VStack{
            VStack{
                Text("Player")
                HStack{
                    if(gameViewModel.playerPlay?.play.rawValue == "石頭"){
                        Image("stone").resizable().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }else if(gameViewModel.playerPlay?.play.rawValue == "剪刀"){
                        Image("scissor").resizable().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }else{
                        Image("paper").resizable().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    Text(gameViewModel.playerPlay?.play.rawValue ?? "布").padding()
                }

            }
            VStack{
                Text("Computer")
                HStack{
                    if(gameViewModel.computerPlay?.play.rawValue == "石頭"){
                        Image("stone").resizable().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }else if(gameViewModel.computerPlay?.play.rawValue == "剪刀"){
                        Image("scissor").resizable().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }else{
                        Image("paper").resizable().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    Text(gameViewModel.computerPlay?.play.rawValue ?? "布").padding()
                }
            }
            if let result = gameViewModel.result{
                HStack{
                    Text("result: ")
                    Text(result == .win ? "Win " : "Lose " )
                    .font(.system(size: 60))
                }

            }
            
            Button(action: {
                gameViewModel.action()
            }, label:{
                Text("Start")
            })
        }.font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
