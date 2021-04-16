//
//  ContentView.swift
//  Button_iOS13
//
//  Created by Derrick kim on 2021/04/16.
//

import SwiftUI

struct ContentView: View {
    
    //  Field
    @State private var isSelectedState = false
    
    var buttonColor : Color {
        if isSelectedState{
            return .red
        }else{
            return .blue
        }
    }
    
    var body: some View {
      
        VStack{
            Text("Hello, World")
            Text("Selected state : \(self.isSelectedState.description)")
            
            Button(action: {
                print("Hi")
                self.isSelectedState.toggle()
            }
                   , label: {
                Text("Trash")
            })
            
            Button(action: {
                print("HOHOHOHO")
            }
                   , label: {
                    HStack(){
                        
                        Image(systemName: "pencil")
                            .foregroundColor(Color.red)
                            .font(.largeTitle)
                            .hidden()
                        
                        Text("Share")
                            .fixedSize()
                            .foregroundColor(isSelectedState ? .red : .blue)
                            .font(.largeTitle)
                        if self.isSelectedState{
                            Image(systemName: "pencil")
                                .foregroundColor(Color.red)
                                .font(.largeTitle)
                        }
                     
                        
                    }
                        
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
