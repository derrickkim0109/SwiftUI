//
//  ContentView.swift
//  Text_overlay_iOS13
//
//  Created by Derrick kim on 2021/04/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .underline()
//            .padding([.trailing, .top],25)
//            .padding(EdgeInsets(top: 10, leading: 20, bottom: 30, trailing: 40))
            .padding(20)
            .frame(width: 200, height: 50, alignment: .center)
            .background(Color.yellow)
            .cornerRadius(25) // height 반값까지만 먹힘.
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 25.0 + 10)
                    .stroke(Color.blue, lineWidth: 10)
            )
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 45)
                    .stroke(Color.blue, lineWidth: 5)
            )
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
