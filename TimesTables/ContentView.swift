//
//  ContentView.swift
//  timestables
//
//  Created by Alysha Reinard on 1/14/20.
//  Copyright © 2020 Alysha Reinard. All rights reserved.
//



import SwiftUI

struct ContentView: View {
//    @State var vals: [Int]
    @State var vals = [1, 2]
    @State var val = 1
    
    struct ButtonStyle: ViewModifier {
        func body(content:Content) -> some View {
            return content
//                .fontWeight(.bold)
                .font(.title)
                .padding()
                .background(Color.purple)
                .cornerRadius(40)
                .foregroundColor(.white)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.purple, lineWidth: 5)
            )
        }
    }
    
    
    var body: some View {
        
        NavigationView {
            VStack{
                Text("Which times tables would you like to practice?")
                Spacer()
                Button(action:{
                    self.toggle_val()
                    print("toggling")
                }){
                    Text("1").modifier(ButtonStyle())
                }
                
                Spacer()
                
                NavigationLink(destination: gameView()) {
                    Text("Play game")
                        .font(.headline)
                }
            }
        }
        .navigationBarTitle("TimesTables")
    }

    mutating func toggle_val(){

        if let index = vals.firstIndex(of: val) {
            self.vals.remove(at: index)
        }
        else{
            self.vals.append(val)
        }
    }
 
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
