//
//  secondView.swift
//  SwiftUICourses
//
//  Created by 李承紘 on 2021/5/3.
//

import SwiftUI

struct secondView: View {
    let lyrics = ["当你知道一切都不重要的时候，整个宇宙都会是你的，但我没有见过一个宇宙喜欢这样。宇宙是一头野兽，他以平庸的人为食，创造出无数白痴只是为了吃掉他们。聪明人有机会爬上顶峰，骑在现实背上，但现实会不停地试着把你甩下去，并且，最终他会成功。","人们所谓的爱情，只不过是为了促使人类繁衍后代的化学反应，爱情来的猛烈，莫蒂，但是它会悄悄地溜走，把你留在一场失败的婚姻中。","别为失败做打算，这比庸常的打算还要愚蠢。"]
    var body: some View {
          VStack {
             Image("rick")
                .resizable()
                .scaledToFit()
            ForEach(0..<lyrics.count){
                index in Text("\(index+1)st quote: \(lyrics[index])\n")
            }
          }
        
        
       }
}

struct secondView_Previews: PreviewProvider {
    static var previews: some View {
        secondView()
    }
}
