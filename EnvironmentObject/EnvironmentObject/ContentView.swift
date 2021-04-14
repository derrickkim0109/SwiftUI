//
//  ContentView.swift
//  EnvironmentObject
//
//  Created by Derrick kim on 2021/04/14.
//

import SwiftUI

// EnvironmentObject
// Singleton Pattern과 유사 하나. 조금 애매함.
// 이게 더 깔끔함.

class MyInfo: ObservableObject {
    
    //--------------
    // Properties
    //--------------
    
    @Published var name = "" // 화면에 표시할 변수
    @Published var photoURL = "" // 화면에 표시할 변수
    var token = "" // 화면에 표시 안할 변수
    
}
class MyLocation: ObservableObject {
    @Published var geo = ""
}


struct ContentView: View {
    
    //--------------
    // Properties
    //--------------
    @EnvironmentObject var myInfo: MyInfo
    @EnvironmentObject var myLocation: MyLocation
    
    var body: some View {
        
        NavigationView(content: {
            VStack{
                NavigationLink(destination:
                                DetailView()
                )
                    {
                    /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/
              
                    }
                
                    Text("name : \(myInfo.name)")
                        .padding()
                    Text("url : \(myInfo.photoURL)")
                        .padding()
                 }
            
        })
        .onAppear{
            myInfo.name = "Derrick Kim"
            myInfo.photoURL = "https://aaa.com"
        }
        
      
    }
}
struct DetailView:View {
    //--------------
    // Properties
    //--------------
    @EnvironmentObject var myInfo: MyInfo
    
    var body: some View{
        VStack{
            Text("Detail name : \(myInfo.name)")
                .padding()
            Text("Detail url : \(myInfo.photoURL)")
                .padding()
            
            Button("Chage my name"){
                myInfo.name = "Kim Tae Hyun"
            }
        }
    }
}

// 이곳을 Preview라 굳이 안써도 됨.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MyInfo())
            .environmentObject(MyLocation())
    }
}
