//
//  ContentView.swift
//  timestables
//
//  Created by Alysha Reinard on 1/14/20.
//  Copyright © 2020 Alysha Reinard. All rights reserved.
//



import SwiftUI

class Options: ObservableObject {
    @Published var vals: [Int]
    
    init(){
        vals=[]
        
    }
}

struct ContentView: View {
    //    @State var vals: [Int]
    @ObservedObject var options=Options()
    @State var val = 1
    
    struct ButtonStyle: ViewModifier {
        func body(content:Content) -> some View {
            return content
                //                .fontWeight(.bold)
                .font(.title)
                .padding()
                .background(Color.purple)
                .cornerRadius(5)
                .foregroundColor(.white)
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.purple, lineWidth: 1)
            )
        }
    }
    
    
    var body: some View {
        
        NavigationView {
            VStack{
                Spacer()
                Text("Which times tables would you like to practice?")
                Spacer()
                HStack{
                    
                    Button(action:{
                        self.toggle_val(1)
                    }){
                        Text("1").modifier(ButtonStyle())
                    }
                    
                    Button(action:{
                        self.toggle_val(2)
                    }){
                        Text("2").modifier(ButtonStyle())
                    }
                    
                    Button(action:{
                        self.toggle_val(3)
                    }){
                        Text("3").modifier(ButtonStyle())
                    }
                    
                    Button(action:{
                        self.toggle_val(4)
                    }){
                        Text("4").modifier(ButtonStyle())
                    }
                    
                    Button(action:{
                        self.toggle_val(5)
                    }){
                        Text("5").modifier(ButtonStyle())
                    }
                    
                    Button(action:{
                        self.toggle_val(6)
                    }){
                        Text("6").modifier(ButtonStyle())
                    }
                }
                Spacer()
                HStack{
                    
                    Button(action:{
                        self.toggle_val(7)
                    }){
                        Text("7").modifier(ButtonStyle())
                    }
                    
                    Button(action:{
                        self.toggle_val(8)
                        print("toggling", self.options.vals)
                    }){
                        Text("8").modifier(ButtonStyle())
                    }
                    
                    Button(action:{
                        self.toggle_val(9)
                        print("toggling", self.options.vals)
                    }){
                        Text("9").modifier(ButtonStyle())
                    }
                    
                    Button(action:{
                        self.toggle_val(10)
                        print("toggling", self.options.vals)
                    }){
                        Text("10").modifier(ButtonStyle())
                    }
                    
                    Button(action:{
                        self.toggle_val(11)
                        print("toggling", self.options.vals)
                    }){
                        Text("11").modifier(ButtonStyle())
                    }
                    Button(action:{
                        self.toggle_val(12)
                        print("toggling", self.options.vals)
                    }){
                        Text("12").modifier(ButtonStyle())
                    }
                    
                    
                    
                }
                Spacer()
                
                NavigationLink(destination: gameView(options: self.options)) {
                    Text("Play game")
                        .font(.headline)
                }
                Spacer()
            }
        }
        .navigationBarTitle("TimesTables")
    }
    
    func toggle_val(_ val:Int){
        
        if let index = self.options.vals.firstIndex(of: val) {
            self.options.vals.remove(at: index)
        }
        else{
            self.options.vals.append(val)
        }
    }
    
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
