//
//  ContentView.swift
//  TextEditer
//
//  Created by Derrick kim on 2021/04/13.
//

import SwiftUI

struct ContentView: View {
    
    //------------
    // Properties
    //------------
    @State private var inputText = ""
    
    var body: some View {
        VStack{
            // 받은 값을 바로 모델에 적용해야하기 때문에 Binding되있음.
            // padding을 조금이라도 잡아주어야 Safe Area를 넘어서 됨
           TextEditor(text: $inputText)
            .padding(1)
            .lineSpacing(40)
            .font(.title)
            .disableAutocorrection(true)  // 자동완성 글자.
            // 글자수 제한을 하려고 하면 .!
            .onChange(of: inputText, perform: { value in
                if inputText.count > 100 {
                    inputText.removeLast()
                }
            })
            HStack{
                Spacer()
                Text("\(inputText.count)" + " / 100")
            }
            .padding(20)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
