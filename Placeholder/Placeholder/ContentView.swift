//
//  ContentView.swift
//  Placeholder
//
//  Created by Derrick kim on 2021/04/13.
//

import SwiftUI

// Placeholder
// redact

struct ContentView: View {
    
    // ----------
    // Properties
    // ----------
    @State private var myString = "Hi, Derrick"
    
    @State private var showPlaceholder = false
    
    var body: some View {
        VStack{
            VStack{
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle().stroke())// 원의 선을 그려줌.
                
                Text(myString)
                    .foregroundColor(.pink)
                    .padding()
            }
            .redacted(reason: showPlaceholder ? .placeholder: .init())
            //.init() 사용하지 않는 상태
            Button("click me") {
                showPlaceholder.toggle()
            }
        }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
