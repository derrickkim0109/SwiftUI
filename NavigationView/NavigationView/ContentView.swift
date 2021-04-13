//
//  ContentView.swift
//  NavigationView
//
//  Created by Derrick kim on 2021/04/13.
//

import SwiftUI

// Navigation View

struct ContentView: View {
    
    //-------------
    // Properties
    //-------------
    
    // 기본적으로 앱을 구동했을때 바로 구현될 기능들
    init() {
        
//        UINavigationBar.appearance().titleTextAttributes = [ .foregroundColor : UIColor.red]
        let myAppearance = UINavigationBarAppearance()
            
        myAppearance.titleTextAttributes = [
            .foregroundColor : UIColor.red,
            .font : UIFont.italicSystemFont(ofSize: 50)
        
        ]
        
        // Background color
        myAppearance.backgroundColor = .orange
        UINavigationBar.appearance().standardAppearance = myAppearance
        
        //-------
        // .large로 설정한경우 타이틀에 똑같이 색적용 시키고싶을때
        //-------
        UINavigationBar.appearance().scrollEdgeAppearance = myAppearance
        // iPhone이 아닌 다른 모델일경우 꼭 설정해야하는것
        UINavigationBar.appearance()
            .compactAppearance = myAppearance
        myAppearance.largeTitleTextAttributes = [
            .foregroundColor : UIColor.blue
        ]
        
        // Appearance라고 잡힌 영역만 칠해짐.
        //UINavigationBar.appearance().backgroundColor = .gray
        
        //-------
        // Detail로 들어갔는데 Back 버튼 컬러 변경 원하면
        //-------
        
        UINavigationBar.appearance().tintColor = .brown
    }
    
    
    var body: some View {
        NavigationView{
//
//            List{
//                Text("Hello, world!")
//                    .padding()
//            }
//
//                // 옆으로 갈수 있게 버튼 만드는 것이다.
//                NavigationLink("click me", destination:
//                                Text("Detail")
//                               )
//
            List{
                NavigationLink(
                    destination: Text("Destination"),
                    label: {
                        HStack{
                            Image(systemName: "person")
                            Text("Navigate")
                        }
                       
                    }
            )}
            
            // .large 는 화면을 올렸을 경우 타이틀이 보임
            // .inline은 항상 떠있음.
           .navigationBarTitle("Hello", displayMode: .large)
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
