//
//  ContentView.swift
//  Stack
//
//  Created by Derrick on 2021/03/21.
//

import SwiftUI
// Stack
// V H Z
// Z : FrameLayout과 비슷하다.
struct ContentView: View {
    var body: some View {
        ZStack{
            Color.green
                // Safe Area부분도 채우고 싶을경우.
                .edgesIgnoringSafeArea(.all)
            // 윗부분만
                //.edgesIgnoringSafeArea(.top)
            // 밑부분만.
                //.edgesIgnoringSafeArea(.bottom)
            VStack{
                HStack{
                        Text("Hello, world!")
                    VStack{
                        Text("Hello, world!")
                        Text("Hello, world!")
                    }
                }.padding(.bottom,40)
                // HStack
                Text("Hello, world!").padding(.top,400)
                    .font(.largeTitle)
                    .foregroundColor(.red)
                    .padding(.leading, 80)
            }
         
            
                
            
                
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
