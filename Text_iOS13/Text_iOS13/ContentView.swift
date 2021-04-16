//
//  ContentView.swift
//  Text_iOS13
//
//  Created by Derrick kim on 2021/04/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            Color.yellow
                .edgesIgnoringSafeArea(.top)
            VStack{
                    Text("Hello")
                        .foregroundColor(Color.green)
                        .font(.largeTitle)
                        .background(Color.white)
                        .padding(20)
                        .background(Color.blue)
                        .padding(20)
                        .background(Color.orange)
                
                    Text("Woo")
                
            }
          
        }
        
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
