//
//  mainView.swift
//  SwiftUICourses
//
//  Created by 李承紘 on 2021/5/3.
//

import SwiftUI

struct mainView: View {
    
    var body: some View {
        
        NavigationView{
            VStack{
                Image("mainPic").resizable().scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
                NavigationLink(
                    destination: ContentView(),
                    label: {
                        Text("Let's play DiceGame").shadow(color: .white, radius: 3, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/).foregroundColor(.pink)
                    })
                NavigationLink(
                    destination: secondView(),
                    label: {
                        Text("Let's play FoolGame").shadow(color: .white, radius: 3, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/).foregroundColor(.pink)
                    })
            }

        }
        }

}

struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        mainView()
    }
}
