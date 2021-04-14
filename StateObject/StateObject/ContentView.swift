//
//  ContentView.swift
//  StateObject
//
//  Created by Derrick kim on 2021/04/14.
//

import SwiftUI

//  StateObject
//  ObservableObject 둘이 비슷

class MyInfo: ObservableObject {
    
    // Properties
    
    @Published var myScore = 0
}


struct ContentView: View {
    
    // Properties
    
    // State가 View를 유지해야하는 상태랑
    // View를 계속해서 갱신해서 나타내야하는 차이가 있음.
    
    @ObservedObject var myInfo = MyInfo()
    
    
    var body: some View {
        
        // @ObservedObject 특징
        // 1. 두군데 다 @ObservedObject 이면
        // Custom에서는 값이 갱신됨.
        
        // @StateObject 특징
        // 1. View를 유지 시키면 값이 갱신 되지않음.
        
        VStack{
            
            Text("myInfo : \(myInfo.myScore)")
                .font(.largeTitle)
            
            Button("Plus"){
                myInfo.myScore += 1
            }
           CustomButton()
           
        }
    }
}

struct CustomButton : View {
    
    // Properties
    @StateObject var myInfo2 = MyInfo()
    
    var body: some View{
        VStack{
            Text("myInfo2 : \(myInfo2.myScore)")
                .font(.largeTitle)
            
            Button("Plus2"){
                myInfo2.myScore += 1
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

