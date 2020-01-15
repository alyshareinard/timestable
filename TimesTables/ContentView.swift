//
//  ContentView.swift
//  timestables
//
//  Created by Alysha Reinard on 1/14/20.
//  Copyright © 2020 Alysha Reinard. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var min1 = 1
    var min2 = 1
    var max1 = 6
    var max2 = 12
    @State var num1 = Int.random(in: 1...6)
    @State var num2 = Int.random(in: 1...12)
    @State var answer = ""
    @State var feedback = ""
    @State var next = false
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
                Button(action:{
                    if Int(self.answer) == self.num1 * self.num2 {
                        self.feedback = "Correct!"
                    } else {
                        self.feedback = "Try again"
                    }}
                ){
                    HStack{
                        Text("Enter")
                    }//Hstack
                }//Enter button
                .background(Image("Button"))
                Spacer()
                Button(action:{
                    self.next = true
                    self.num1 = Int.random(in: self.min1...self.max1)
                    self.num2 = Int.random(in: self.min2...self.max2)
                    self.feedback = " "
                    self.answer = ""
                }){
                    HStack{
                        Text("Next")
                    }
                    
                }//Next button
                .background(Image("Button"))
                Spacer()
            }//Button Hstack

            Spacer()
            Text("\(feedback)")
            Spacer()
            Text("\(num1) * \(num2) = ?")
            Spacer()
            
            UITextField("", text: $answer)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
//                .padding(.leading, 80)
//                .padding(.trailing, 80)
                .frame(maxWidth: 80)
                
            
            Text("\(feedback)")
        }//Vstack

        .padding(.top, 20)
        .padding(.bottom, 50)
        
    }//body
    extension UITextField {

       func addDoneButtonOnKeyboard() {
           let keyboardToolbar = UIToolbar()
           keyboardToolbar.sizeToFit()
           let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
               target: nil, action: nil)
           let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
               target: self, action: #selector(resignFirstResponder))
           keyboardToolbar.items = [flexibleSpace, doneButton]
           self.inputAccessoryView = keyboardToolbar
       }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
