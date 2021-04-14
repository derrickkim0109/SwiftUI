//
//  ContentView.swift
//  AppStorage
//
//  Created by Derrick kim on 2021/04/14.
//

import SwiftUI

struct ContentView: View {
    
    // Properties
//    @AppStorage("darkmode")
    // darkmode로 할지 안할지에 대한 값을 설정.
    // "mode"란 키워드로 저장하겠다.
    @AppStorage("mode") var mode = false
    @AppStorage("notification Count") var notificationCount = ""
    
    
    var body: some View {
        
        
        ZStack{
            // App을 껏다 켜도 ture면 ture로 유지가 됨.
            mode ? Color.orange.opacity(0.2) : Color.gray
            
            // 이 색을 다크모드와 아닐경우를 비교를해야함.
           
            VStack{
                Button(action: {
                    mode.toggle()
                }, label: {
                    Text("Button")
                })
                TextField("Notification Count", text: $notificationCount)
                
            }
        }
      
    }
    
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
