//
//  ContentView.swift
//  NetWorkImage
//
//  Created by Derrick kim on 2021/04/14.
//

import SwiftUI
//  http://mockapi.io/ <- main site URL

// https://6076a03e1ed0ae0017d696a8.mockapi.io/user

struct ContentView: View {
    
    // Fields
    @State private var users = [User]()
    
    var body: some View {
        ScrollView{
            
        LazyVGrid(columns: [GridItem(.flexible())],
                  content: {
          
                    // onAppear 후 마지막으로
                    ForEach(users) { user in
                        HStack{
                            URLImage(urlString: user.avatar)
                            Text("\(user.name)")
                        }
                    }
            
        })
        .onAppear{
            WebService().loadUsers { (users) in
                self.users = users
            }
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
