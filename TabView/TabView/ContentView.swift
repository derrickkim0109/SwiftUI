//
//  ContentView.swift
//  TabView
//
//  Created by Derrick kim on 2021/04/13.
//

import SwiftUI

// TabView

struct ContentView: View {
    
    
    var body: some View {
        TabView{
            First()
                // 누른 상태가 됨.
                .tabItem {
                    Image(systemName:
                        "person"
                        )
                    Text("Person")
                }
                .edgesIgnoringSafeArea(.top)
            Second()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Second")
                }
        }
    }
}

struct First: View {
    var body: some View{
        ZStack{
            Color.orange
            Text("First")
        }
        
    }
    
}

struct Second: View {
    var body: some View{
        ZStack{
            Color.green
            Text("Second")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
