//
//  ContentView.swift
//  ScrollViewReader
//
//  Created by Derrick kim on 2021/04/13.
//

import SwiftUI

//ScrollViewReader

struct ContentView: View {
    
    //-----------
    // Properties
    //-----------
    @State private var proxy: ScrollViewProxy?
    
    
    var body: some View {
        
        VStack{
            
            Button("Scroll To"){
                withAnimation(.easeInOut){
                    proxy?.scrollTo(0, anchor: .top)
                }
            }
            .padding()
            
            ScrollView{
                
                ScrollViewReader(content: { proxy in
                    // self.proxy = proxy <- 여기서는 불가능 : 화면을 계속그리는 부분이기 때문에.
                    
                    ForEach(0..<50){ index in
                        Text("\(index)")
                            .padding()
                    }
                    // Data setting 된후
                    .onAppear(perform: {
                        self.proxy = proxy
                    })
                    
                })
               
            }
        }
        
       
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
