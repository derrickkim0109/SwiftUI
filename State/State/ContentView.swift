//
//  ContentView.swift
//  State
//
//  Created by Derrick kim on 2021/04/14.
//

import SwiftUI

struct ContentView: View {
   
    //-------------
    // Properties
    //-------------
    
    // State 안넣으면 버튼에서 안먹음
    @State private var myName = "kim"
    
    
    
    var body: some View {
        VStack{
            Text(myName)
                .padding()
            Button("change name"){
                myName = "lee"
            }
            // State 때문에 같이 변동된다.
            TextField("TF Title", text: $myName)
        }
  
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
