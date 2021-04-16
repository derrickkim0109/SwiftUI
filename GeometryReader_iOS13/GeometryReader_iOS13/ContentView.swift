//
//  ContentView.swift
//  GeometryReader_iOS13
//
//  Created by Derrick kim on 2021/04/16.
//

import SwiftUI



struct ContentView: View {
    
    var body: some View {
        
        HStack(spacing: 0){
            
            Text("Hi")
            
            GeometryReader { proxy in
                VStack{
                    Text("Hello Derrick")
                        .frame(width :100)
        //                .padding(.horizontal, 20)
        //                .frame(width:UIScreen.main.bounds.size.width)
                        .frame(width: proxy.size.width)
                    Text("\(proxy.size.width)")
                    // .local 해당영역, .global은 전체영역.
                    Text("\(proxy.frame(in: .global).minX)")
                }
               
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
