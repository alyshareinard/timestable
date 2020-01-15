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
    @State var answer = " "
    @State var feedback = " "
    @State var next = false
    @State var alertIsVisible: Bool = false
    @State var nextdisabled = true
    let midnightblue = Color(red: 0.0/255.0, green: 51.0/255.0, blue: 102.0/255.0 )
    
    

    
    var body: some View {
        VStack {
            
            
            Spacer()
            HStack{


                Spacer()

                Text("\(num1) * \(num2) = ?")
                .font(.system(size: 40))
                Spacer()
                Text("\(feedback)")
                Spacer()
                Button(action:{
                    
                    self.next = true
                    self.num1 = Int.random(in: self.min1...self.max1)
                    self.num2 = Int.random(in: self.min2...self.max2)
                    self.feedback = " "
                    self.answer = ""
                    self.nextdisabled = true
                }){
                    HStack{
                        Text("Next")
                    }
                        
                }//Next button
                .background(Image("Button"))
                .disabled(nextdisabled)
                Spacer()
            }
            Spacer()
            Text("\(answer)")
                .padding(.trailing, 10)
                .font(.system(size: 30))
                .border(Color(white: 0.01))

            Spacer()
            //setting up number buttons
            VStack{
                HStack{
                    Spacer()
                    Button(action:{
                        self.answer+="1"
                    }){
                        HStack{
                            Text("1")
                        }
                    }
                    .background(Image("Button"))

                    Button(action:{
                        self.answer+="2"
                    }){
                        HStack{
                            Text("2")
                        }
                    }
                    .background(Image("Button"))
                    .padding(.leading, 90)
                    .padding(.trailing, 90)
                    Button(action:{
                        self.answer+="3"
                    }){
                        HStack{
                            Text("3")
                        }
                    }
                    .background(Image("Button"))
                    Spacer()
                    }//Hstack for top row of buttons (1-3)
                 .padding(20)
                HStack{
                    Spacer()
                    Button(action:{
                        self.answer+="4"
                    }){
                        HStack{
                            Text("4")
                        }
                    }
                    .background(Image("Button"))
                
                    Button(action:{
                        self.answer+="5"
                    }){
                        HStack{
                            Text("5")
                        }
                    }
                    .background(Image("Button"))
                    .padding(.leading, 90)
                    .padding(.trailing, 90)
                  
                    Button(action:{
                        self.answer+="6"
                    }){
                        HStack{
                            Text("6")
                        }
                    }
                    .background(Image("Button"))
                    Spacer()
                }//Hstack for second row of buttons (4-6)
                 .padding(20)
                HStack{
                    Spacer()
                    Button(action:{
                        self.answer+="7"
                    }){
                        HStack{
                            Text("7")
                        }
                    }
                    .background(Image("Button"))
               
                    Button(action:{
                        self.answer+="8"
                    }){
                        HStack{
                            Text("8")
                        }
                    }
                    .background(Image("Button"))
                    .padding(.leading, 90)
                    .padding(.trailing, 90)
                 
                    Button(action:{
                        self.answer+="9"
                    }){
                        HStack{
                            Text("9")
                        }
                    }
                    .background(Image("Button"))
                    Spacer()
                }//Hstack for third row of buttons (7-9)
                .padding(20)
                HStack{
                    Spacer()
                    Button(action:{
                        self.answer =  String((self.answer).dropLast(1))
                        //self.answer = ans
                    }){
                        HStack{
                            Text("⎌")
                            .font(.system(size: 40))
                        }
                    }
                    .background(Image("Button"))
                
                    Button(action:{
                        self.answer+="0"
                    }){
                        HStack{
                            Text("0")
                        }
                    }
                    .background(Image("Button"))
                    .padding(.leading, 80)
                    .padding(.trailing, 84)
                    
                    
                    
                    Button(action:{
                          if Int(self.answer.trimmingCharacters(in: .whitespacesAndNewlines)) == self.num1 * self.num2 {
       

                            //self.round+=1
                            self.feedback = "Correct \(self.num1) + \(self.num2) = \(self.answer)!"
                            self.nextdisabled = false
                          } else {
                            self.feedback = "Try again"
                            self.answer = " "
                          }

                    })//Button
                    {
                        Text("⮑")
                    }//text for Button
                    .background(Image("Button"))
                    
                    
                    
                    
                    Spacer()

                }//Hstack for final row of buttons
                
            } //Vstack for buttons
           
        }//Vstack
        .accentColor(midnightblue)
        .padding(.top, 20)
        .padding(.bottom, 50)
        
    }//body

    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height:414))
    }
}
