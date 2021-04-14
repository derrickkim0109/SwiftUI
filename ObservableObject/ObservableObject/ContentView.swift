//
//  ContentView.swift
//  ObservableObject
//
//  Created by Derrick kim on 2021/04/14.
//


import SwiftUI

//  ObservableObject
// -> 구조를 좀 복잡하게 가져가고.class기반으로 되있으면서
// 여기저기서 사용할 Model을 만들경우


class MyInfo: ObservableObject {
    
    // ------------
    // Properties
    // ------------
    
    // 변수의 형태가. 계속 변화되는것을 관측하기위해서는
    // @published가 필요
    
    @Published var myAge = 30
    
    // Property Observer
    // 그냥 조건 없이 하고 싶은 경우. -> Published
    // 조건을 넣어서 할 경우 (ex. 정규식에 아주 유용할듯)
    var myName = "Derrick"{
        // 값이 변경된 후
        didSet{
            // Before Value
            if oldValue.count == 0{
                objectWillChange.send() // On
            }
        }
    }
    
}


struct ContentView: View {
    
    // ------------
    // Properties
    // ------------
    
    // Published 된 것들을 관찰해서 사용할수 있게 만드는 키워드
    // @ObservedObject
    @ObservedObject var myInfo = MyInfo()
    
    var body: some View {
        VStack{
            Text("Hello, \(myInfo.myName)")
                .padding()
            
            Button("Change Name") {
                myInfo.myName = "Tae Hyun"
            }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
