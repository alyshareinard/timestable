//
//  gameview.swift
//  TimesTables
//
//  Created by Alysha Reinard on 2/2/20.
//  Copyright © 2020 Alysha Reinard. All rights reserved.
//

import SwiftUI

struct gameView: View {
//    @State var values1 = [1]//, 2, 3, 4, 5, 6]
    @State var values2 = [3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    @ObservedObject var options: Options
    
    var min1 = 1
    var min2 = 1
    var max1 = 6
    var max2 = 12
    
    @State var response = " "
    @State var feedback = " "
    @State var points = 0
    @State var myproblems = [[Int]]()
    @State var problem = [0,0,0]
    @State var alldone = false
    let midnightblue = Color(red: 0.0/255.0, green: 51.0/255.0, blue: 102.0/255.0 )
    
    
    @State var time = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var choosevals = true
    
    var body: some View {
        
        VStack(alignment:.leading) {
            
            
            Spacer()
            HStack{
                
                Spacer()
                Text("\(problem[0]) x \(problem[1]) = ")
                    .font(.system(size: 40))
                Text("\(response)")
                    .padding(.trailing, 10)
                    .padding(.leading, 6)
                    .font(.system(size: 30))
                    .border(Color(white: 0.01))
                Spacer()
                Text("\(feedback)")
                    .padding(.trailing, 20)
                
                Spacer()
            }
            
            Spacer()
            HStack{
                //setting up number buttons
                VStack(alignment: .leading){
                    
                    Group{
                        HStack{
                            Button(action:{self.response+="1"}){
                                Text(" 1")
                            }
                            .background(Image("Button"))
                            
                            Button(action:{self.response+="2"}){
                                Text(" 2")
                            }
                            .background(Image("Button"))
                            .padding(.leading, 82)
                            .padding(.trailing, 82)
                            
                            Button(action:{self.response+="3"}){
                                Text(" 3")
                            }
                            .background(Image("Button"))
                            
                            Spacer()
                        }//Hstack for top row of buttons (1-3)
                            .padding(.leading, 80)
                            .padding(.bottom, 20)
                        
                        HStack{
                            Button(action:{self.response+="4"}){
                                Text(" 4")
                            }
                            .background(Image("Button"))
                            
                            Button(action:{self.response+="5"}){
                                Text(" 5")
                            }
                            .background(Image("Button"))
                            .padding(.leading, 80)
                            .padding(.trailing, 82)
                            
                            Button(action:{self.response+="6"}){
                                Text(" 6")
                            }
                            .background(Image("Button"))
                            
                            Spacer()
                        }//Hstack for second row of buttons (4-6)
                            .padding(.leading, 80)
                            .padding(.bottom, 20)
                    }
                    Group{
                        
                        HStack{
                            
                            Button(action:{self.response+="7"}){
                                Text(" 7")
                            }
                            .background(Image("Button"))
                            
                            Button(action:{self.response+="8"}){
                                Text(" 8")
                            }
                            .background(Image("Button"))
                            .padding(.leading, 80)
                            .padding(.trailing, 82)
                            
                            Button(action:{self.response+="9"}){
                                Text(" 9")
                            }
                            .background(Image("Button"))
                            Spacer()
                        }//Hstack for third row of buttons (7-9)
                            .padding(.leading, 80)
                            .padding(.bottom, 20)
                        HStack{
                            Button(action:{
                                self.response =  String((self.response).dropLast(1))
                                //self.answer = ans
                            }){
                                Text("Undo")
                            }
                            .background(Image("Button"))
                            
                            Button(action:{
                                self.response+="0"
                            }){
                                Text("    0   ")
                            }
                            .background(Image("Button"))
                            .padding(.leading, 55)
                            .padding(.trailing, 57)
                            
                            Button(action:{
                                if Int(self.response.trimmingCharacters(in: .whitespacesAndNewlines)) == self.problem[2] {
                                    
                                    
                                    //self.round+=1
                                    self.feedback = "Correct \(self.problem[0]) x \(self.problem[1]) = \(self.problem[2])!"
                                    
                                    if self.time<5{
                                        self.points+=10
                                    }else if self.time<10{
                                        self.points+=5
                                    }else if self.time<20{
                                        self.points+=2
                                    }
                                    else{
                                        self.points+=1
                                    }
                                    
                                    self.next_problem()
                                    self.time=0
                                    
                                    self.response = " "
                                    
                                } else {
                                    self.feedback = "Try again"
                                    if  !(self.myproblems.contains(self.problem)) {
                                        self.myproblems.append(self.problem)
                                    }
                                    self.response = " "
                                }
                                
                            })//Button
                            {
                                Text("Enter")
                            }//text for Button
                                .alert(isPresented: $alldone){ () ->
                                    Alert in
                                    return Alert(title:Text("Good job!"),
                                                 message:Text("Yur final score was \(self.points)"),
                                                 dismissButton: .default(Text("Finish")){

                                        }
                                                    )
                            }
                                .background(Image("Button"))
                            Spacer()
                            
                        }//Hstack for final row of numpad
                            .padding(.leading, 65)
                    }//group2
                } //Vstack for numpad
                
                VStack (alignment:.leading){
                    Text("\(time)")
                        .onReceive(timer) { _ in
                            
                            self.time += 1
                            
                    }
                    
                    Button(action:{
                        self.create_problems()
                        self.next_problem()
                        
                    }){
                        Text("Restart")
                    }
                    
                    Text("Total points: \(self.points)")
                    Text("Problems remaining: \(self.myproblems.count)")
                    Spacer()
                    
                    
                }//Vstack for points/next button
                Spacer()
                
            }//Hstack for number pad and points/next button
            Spacer()
        }//Vstack
            .accentColor(midnightblue)
            .padding(.top, 20)
            .padding(.bottom, 50)
            .onAppear(perform: startGame)
        
    }//body
    func startGame() {
        self.create_problems()
        self.next_problem()
    }
    func create_problems(){
        //        let svalues1 = values1.shuffled()
        //        let svalues2 = values2.shuffled()
        var allprobs = [[Int]]()
        for val1 in self.options.vals.shuffled() {
            for val2 in values2.shuffled() {
                allprobs.append([val1, val2, val1*val2])
//                self.myproblems.append([val1, val2, val1*val2])
                
            }
        }
        self.myproblems = allprobs.shuffled()
    }
    func next_problem(){
        if myproblems.count>0{
            problem=myproblems.removeFirst()
        }
        else {
            print("All done!")
            alldone=true    
        }
    }

    
}

struct gameView_Previews: PreviewProvider {
    static var previews: some View {
        gameView(options: Options())
    }
}
