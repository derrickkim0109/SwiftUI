//
//  ContentView.swift
//  GeometryReader_iOS13_02
//
//  Created by Derrick kim on 2021/04/16.
//


// GeometryReader -> 크기나 포지션을 조정할 수 있는 기능.


import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        GeometryReader{ proxy in
            VStack{
                Rectangle()
                    .foregroundColor(.red)
                    .frame(height : proxy.size.height / 3 )
                // 전체 화면의 3분의 1
                
                Rectangle()
                    .foregroundColor(.blue)
                
                Rectangle()
                    .foregroundColor(.orange)
                    
            }
        }
        .frame(width: 300, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
