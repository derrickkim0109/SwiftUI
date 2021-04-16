//
//  ContentView.swift
//  Binding_iOS13
//
//  Created by Derrick kim on 2021/04/16.
//

import SwiftUI

struct ContentView: View {
    // Properties wrapper
    @State private var str = "Hello"
    
    var body: some View {
        
    VStack{
            
            TextField("Placeholder TF", text: $str)
                .padding(20)
                .background(Color.black.opacity(0.1))
                .font(.largeTitle)
                .padding(20)
            
            Text("\(str)")
                .padding()
        
            MyButton(str: $str)
            
          
        }
    }
}

struct MyButton: View {
    
    // Properties
    @Binding var str :String
    
    var body: some View{
        Button(action: {
            self.str = "Hello, Kim"
        }, label: {
            Text("Click this Button")
        })
    }
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
