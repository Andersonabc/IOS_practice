//
//  thirdView.swift
//  SwiftUICourses
//
//  Created by 李承紘 on 2021/5/10.
//

import SwiftUI

struct thirdView: View {
    @State private var scale: CGFloat = 50
    var body: some View {
        VStack {
           Image(systemName:"heart.slash.fill")
              .scaleEffect(scale)
         VStack {
             Slider(value: $scale, in: 0...100)
             Text("\(scale, specifier: "%.2f")")
         }
        }.padding()
    }
}

struct thirdView_Previews: PreviewProvider {
    static var previews: some View {
        thirdView()
    }
}
