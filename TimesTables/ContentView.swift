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
    @State private var didTap=[false, false, false, false, false, false, false, false, false, false, false, false]
    
    @State var val = 1
    
    struct ButtonStyle: ViewModifier {
        func body(content:Content) -> some View {
            return content
                //                .fontWeight(.bold)
                //                .font(.title)
                //                .padding()
                //                .background(didTap ? Color.blue : Color.red)
                //                .background(Color.blue)
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
//                Spacer()
                Text("Which times tables would you like to practice?")
                Spacer()
                HStack{
                    Button(action:{
                        self.toggle_val(1)
                        self.didTap[0].toggle()
                    }){
                        Text("1")
                            .font(.title)
                            .padding()
                            .background(didTap[0] ? Color.purple : Color.gray)
                            .modifier(ButtonStyle())
                    }
                    
                    Button(action:{
                        self.toggle_val(2)
                        self.didTap[1].toggle()
                    }){
                        Text("2")
                            .font(.title)
                            .padding()
                            .background(didTap[1] ? Color.purple : Color.gray)
                            .modifier(ButtonStyle())
                    }
                    
                    Button(action:{
                        self.toggle_val(3)
                        self.didTap[2].toggle()
                    }){
                        Text("3")
                            .font(.title)
                            .padding()
                            .background(didTap[2] ? Color.purple : Color.gray)
                            .modifier(ButtonStyle())
                    }
                    
                    Button(action:{
                        self.toggle_val(4)
                        self.didTap[3].toggle()
                    }){
                        Text("4")
                            .font(.title)
                            .padding()
                            .background(didTap[3] ? Color.purple : Color.gray)
                            .modifier(ButtonStyle())
                    }
                    
                }
                Spacer()
                HStack{
                    
                    Button(action:{
                        self.toggle_val(5)
                        self.didTap[4].toggle()
                    }){
                        Text("5")
                            .font(.title)
                            .padding()
                            .background(didTap[4] ? Color.purple : Color.gray)
                            .modifier(ButtonStyle())
                    }
                    
                    Button(action:{
                        self.toggle_val(6)
                        self.didTap[5].toggle()
                    }){
                        Text("6")
                            .font(.title)
                            .padding()
                            .background(didTap[5] ? Color.purple : Color.gray)
                            .modifier(ButtonStyle())
                    }
                    
                    
                    Button(action:{
                        self.toggle_val(7)
                        self.didTap[6].toggle()
                    }){
                        Text("7")
                            .font(.title)
                            .padding()
                            .background(didTap[6] ? Color.purple : Color.gray)
                            .modifier(ButtonStyle())
                    }
                    
                    Button(action:{
                        self.toggle_val(8)
                        self.didTap[7].toggle()
                        
                    }){
                        Text("8")
                            .font(.title)
                            .padding()
                            .background(didTap[7] ? Color.purple : Color.gray)
                            .modifier(ButtonStyle())
                    }
                }
                Spacer()
                HStack{
                    Button(action:{
                        self.toggle_val(9)
                        self.didTap[8].toggle()
                        
                    }){
                        Text("9")
                            .font(.title)
                            .padding()
                            .background(didTap[8] ? Color.purple : Color.gray)
                            .modifier(ButtonStyle())
                    }
                    
                    Button(action:{
                        self.toggle_val(10)
                        self.didTap[9].toggle()
                        
                    }){
                        Text("10")
                            .font(.title)
                            .padding()
                            .background(didTap[9] ? Color.purple : Color.gray)
                            .modifier(ButtonStyle())
                    }
                    
                    Button(action:{
                        self.toggle_val(11)
                        self.didTap[10].toggle()
                        
                    }){
                        Text("11")
                            .font(.title)
                            .padding()
                            .background(didTap[10] ? Color.purple : Color.gray)
                            .modifier(ButtonStyle())
                    }
                    Button(action:{
                        self.toggle_val(12)
                        self.didTap[11].toggle()
                    }){
                        Text("12")
                            .font(.title)
                            .padding()
                            .background(didTap[11] ? Color.purple : Color.gray)
                            .modifier(ButtonStyle())
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
