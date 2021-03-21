//
//  ContentView.swift
//  Text
//
//  Created by Derrick on 2021/03/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack{
            Text("Hello, world!")
                 .font(.largeTitle)
                
//                .frame(width: 100, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding() // 순서를 잘 생각해야함. 패딩 넣고 색넣어야 전체잡힘.
                .background(Color.green)
                .cornerRadius(10) //최대한 많이 줘도 circle형태를 넘어가진 않음. 
                .foregroundColor(.blue)
                .lineLimit(1)// 한줄로 고정됨.
                
            Text("Hello, world!worldworldworldworldworldworldworldworldworldworld")
                .lineSpacing(20) // 양수만 먹힘.
                .lineLimit(2)
                .truncationMode(.tail)
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
