//
//  ContentView.swift
//  AlertView
//
//  Created by Derrick on 2021/04/01.
//

import SwiftUI

// Alert View

struct ContentView: View {
    //-----------
    // Properties
    //-----------
    
    @State private var isShowAlert = false
    @State private var selectText = "X"
    
    var body: some View {
        
        VStack{
            Spacer()
            // True 일경우만 Alert창이 나오도록
            Button("Show Alert") {
                // toggle은 반전 되는것
                isShowAlert.toggle()
            }
            // .alert는 기본적으로 ture이면 나옴.
            .alert(isPresented: $isShowAlert, content: {
                
//                Alert(title: Text("Alert!!") )
//                // ,dismissButton: .cancel() 쓰면 OK가 cancel로 바뀜
                
                let primaryButton = Alert.Button.default(Text("Done")) {
                    selectText = "Done"
                }
                let secondaryButton = Alert.Button.default(Text("Cancel")) {
                    selectText = "Cancel"
                }
                
                return Alert(title: Text("Show Alert!"), primaryButton: primaryButton, secondaryButton: secondaryButton )
                
                
            })
            // Spacer는 맨 밑으로
             Spacer()
             Text("\(isShowAlert.description)")
             Spacer()
             Text("\(selectText)")
             Spacer()
        }
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
