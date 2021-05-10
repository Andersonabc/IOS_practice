//
//  ContentView.swift
//  SwiftUICourses
//
//  Created by 李承紘 on 2021/4/26.
//

import SwiftUI

struct ContentView: View {
    @State var diceNum1 = 1
    @State var diceNum2 = 1
    @State var diceNum3 = 1
    @State var budget = 1000
    @State var isSuccess = false
    @State private var input = ""
    @State private var output = "猜測結果： 猜測中"
    func roll() {
        var temp = 0
        diceNum1 = Int.random(in: 1...6)
        diceNum2 = Int.random(in: 1...6)
        diceNum3 = Int.random(in: 1...6)
        temp += diceNum1
        temp += diceNum2
        temp += diceNum3
        if let total = Int(input) {
            if(total <= temp){
                output = "猜測結果： 猜測失敗 -100"
                budget -= 100
            }
            else{
                output = "猜測結果： 猜測成功 +100"
                budget += 100
            }
        } else {
            print("Plz Input a Number")
        }
        }
    var body: some View {
        VStack {
            Text("骰子遊戲").padding(.horizontal).padding(20)
            HStack{
                Image(systemName: "die.face.\(diceNum1)").resizable().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                Text("骰子1數字： \(diceNum1)").padding(.horizontal)
            }
            HStack{
                Image(systemName: "die.face.\(diceNum2)").resizable().frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("骰子2數字： \(diceNum2)").padding(.horizontal)
            }
            HStack{
                Image(systemName: "die.face.\(diceNum3)").resizable().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("骰子3數字： \(diceNum3)").padding(.horizontal)
            }

            HStack{
                TextField("Your input", text: $input).textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .padding()

                Button(action: {roll()}, label: {
                    Text("Play").font(.largeTitle).foregroundColor(.white)
                }).background(Color.gray).padding()
            }
            Text("\(output)").padding(.horizontal).padding()
            Text("目前金額： \(budget)").padding(.horizontal).padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
