//
//  ContentView.swift
//  Toggle
//
//  Created by Derrick on 2021/03/22.
//

import SwiftUI

struct ContentView: View {
    
    // ------------
    // Properties
    // ------------
    
    // @State 뷰안에서만 사용하는 값.
    @State private var isOn : Bool = false
        
    
    var body: some View {
        // $ <- Binding 하는것이다.
//        Toggle("Toggle Title = \(isOn.description) ", isOn: $isOn)
//
        VStack{
            MyToggle(isOn: $isOn)
            Text("\(isOn.description)")
        }
    }
}

struct MyToggle: View {
    
    // ------------
    // Properties
    // ------------
     // @Binding이라는것은 값을 가질수 없다. 따로 값이 있기때문에
    @Binding var isOn : Bool
    
    var body: some View {
        Toggle("Toggle Title = \(isOn.description) ", isOn: $isOn)
        Toggle(isOn: $isOn, label: {
            // 왼쪽으로 밀어버리고 싶을때
            HStack{
                Spacer()
                VStack{
                    /*@START_MENU_TOKEN@*/Text("Label")/*@END_MENU_TOKEN@*/
                    /*@START_MENU_TOKEN@*/Text("Label")/*@END_MENU_TOKEN@*/
                }
            }
            
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
