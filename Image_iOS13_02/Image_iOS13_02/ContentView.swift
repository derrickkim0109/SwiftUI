//
//  ContentView.swift
//  Image_iOS13_02
//
//  Created by Derrick kim on 2021/04/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Image("planet")
                .resizable()
                .mask(
                    ZStack{
                        Circle()
                            .offset(x:0, y: -25)
                        
                        Circle()
                            .frame(width: 120, height:120)
                            .offset(x:100, y: 100)
                        
                        Circle()
                            .frame(width: 120, height:120)
                            .offset(x:40, y: 200)
                        
                        
                        Rectangle()
                            .frame(width: 100, height: 100)
                            .offset(x:0,y:-250)
                        
                    }
                    
                )
            HStack{
                Image(systemName: "cloud.sun")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.blue)
                    .background(Color.gray)
                    .offset(x: 0, y: -350)
                
                Image(systemName: "cloud.sun")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.blue)
                    .background(Color.gray)
                    .offset(x: 0, y: -350)
                
                Text("Hi")
                    .background(Color.gray)
                    .offset(x: 0, y: -350)
                    
                Text("Hello")
                    .background(Color.gray)
                    .offset(x: 0, y: -350)
                
            }
         
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
