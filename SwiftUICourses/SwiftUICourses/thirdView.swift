//
//  thirdView.swift
//  SwiftUICourses
//
//  Created by 李承紘 on 2021/5/10.
//

import SwiftUI

struct thirdView: View {
    @State private var age = "0"
    @State private var scale: CGFloat = 5
    @State var isBuy = false
    @State var showingAlert = false
    @State private var theDate = Date()
    var classes = ["unKnown", "G-class", "S-class", "E-class", "C-class"]
    @State private var myChoice = "unKnown"
    @State private var answer = ""
    @State var stepperValue: Int = 1

    var body: some View {
        VStack {
            Image("mercedes")
                    .resizable()
                    .scaledToFill()
                    .frame(width: scale, height: 200)
                    .cornerRadius(150)
         VStack {
             Slider(value: $scale, in: 0...122)
             Text("\(scale, specifier: "%.2f")")
         }
        VStack {
            DatePicker("Date:", selection: $theDate, displayedComponents: .date).padding()
        }
        VStack {
           Picker(selection: $myChoice, label: Text("Choose the one you love")) {
              ForEach(classes, id: \.self) { (myClass) in
                 Text(myClass)
              }
           }.frame(width: 300, height: 100)
           .background(Color.yellow)
           .cornerRadius(30)
           .shadow(radius: 30)
        }
         
        TextField("Your age", text: $age)
           .textFieldStyle(RoundedBorderTextFieldStyle())
           .keyboardType(.numberPad)
           .padding()
            
        Toggle(isOn: $isBuy, label: {
                        Text("Preview the text")
        }).padding()
        Stepper("Number of family member: \(stepperValue)", value: $stepperValue).padding()
            
        if(isBuy){
            Text("Age: \(age) Family member: \(stepperValue).\nYour choice is \(myChoice) on \(theDate, style: .date).\n ")
        }
        }
        
        Button("Show Alert") {
                showingAlert = true
        }.alert(isPresented: $showingAlert) {
            Alert(title: Text("Important message"), message: Text("Age: \(age) Family member: \(stepperValue).\nYour choice is \(myChoice) on \(theDate, style: .date).\n "), dismissButton: .default(            Text("Got it!")))
        }
       
    }
}

struct thirdView_Previews: PreviewProvider {
    static var previews: some View {
        thirdView()
    }
}
