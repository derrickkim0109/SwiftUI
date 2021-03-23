//
//  ContentView.swift
//  Button
//
//  Created by Derrick on 2021/03/22.
//

import SwiftUI

// Button
// State (Property wrapper)
// 하나의 뷰 안에서 사용되는 값

struct ContentView: View {
    
    // ------------
    // Properties
    // ------------
    
    // State <- Write 를 할경우
    @State private var didSelected : Bool = false

    var buttonImage : String {
        // true
        if didSelected {
            return "circle"
        }else{
            return "pencil"
        }
    }
    
    
    var body: some View {
        VStack{
            Button(action: {
                didSelected.toggle() // 자동으로 true false를 해줌.
            }, label: {
                HStack{
                    Image(systemName: buttonImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    VStack{
                        Text("Button")
                        Text("\(didSelected.description)")
                    }
                }
            })
            .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Text("current Status : \(didSelected.description)")
            // description 은 이 형태의 값을 String으로 표현해줌.
        }
    }
       
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
