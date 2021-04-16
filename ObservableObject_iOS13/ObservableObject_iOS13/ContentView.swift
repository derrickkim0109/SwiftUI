//
//  ContentView.swift
//  ObservableObject_iOS13
//
//  Created by Derrick kim on 2021/04/16.
//
// ObservableObject - 관찰 가능한 객체
// ObservedObject - 관찰 된 객체
// 관찰 - 변경 삭제 추가 -> 상태변경을 계속 확인하는것.

// class에서 가능

import SwiftUI

class MyProfile: ObservableObject {
    
    //Properties
    @Published var name = "Derrick Kim"
    @Published var age = 30
    
    func changeProfile(){
        self.age = 34
        self.name = "My lover"
    }
}


struct ContentView: View {
    
    //Properties
    @ObservedObject var profile = MyProfile()
    
    var body: some View {
        VStack{
            Text("age :  \(self.profile.age)")
            Text("name :  \(self.profile.name)")
                .padding(.bottom,20)
            Button(action: {
//                self.profile.age = 34
//                self.profile.name = "Shon Bo Young"
                self.profile.changeProfile()
            }, label: {
                Text("Click Another ")
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
