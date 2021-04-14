//
//  ContentView.swift
//  Binding
//
//  Created by Derrick kim on 2021/04/14.
//

import SwiftUI

//  Binding

struct ContentView: View {
    
    //-----------
    // Properties
    //-----------
    @State private var myBool = false
    
    
    var body: some View {
        NavigationView(content: {
          
            VStack{
        
                NavigationLink(destination:
                                DetailView(mainToggleValue: $myBool)
                )
                {
                    /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/
                    
                }
                
                Toggle("main \(myBool.description)", isOn: $myBool)
        }
        })
    }
}

struct DetailView:View {
    
    //-----------
    // Properties
    //-----------
    // Binding은 원래값이 어디있는 상태이다 알려주는 것이기때문에
    // Type만 정할수 있다. <- 값을 지정 못하고 값을 받아만 오기때문.
    
    @Binding var mainToggleValue: Bool
    
    var body: some View{
        Toggle("datail toggle", isOn: $mainToggleValue)
    }
    
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
