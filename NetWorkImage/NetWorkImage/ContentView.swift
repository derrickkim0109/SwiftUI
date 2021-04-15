//
//  ContentView.swift
//  NetWorkImage
//
//  Created by Derrick kim on 2021/04/14.
//

import SwiftUI
//  http://mockapi.io/ <- main site URL

// https://6076a03e1ed0ae0017d696a8.mockapi.io/users

struct ContentView: View {
    
    // Fields
    @State private var users = [User]()
    
    var body: some View {
        
        NavigationView{
            ScrollView
            {
             LazyVGrid(columns: [GridItem(.flexible())],
                      content: {
                        // onAppear 후 마지막으로
                        ForEach(users)
                        {
                            user in
                            NavigationLink(
                                destination:
                                    UserDetailView(user: user),
                                label: {
                                    HStack
                                    {
                                        URLImage(urlString: user.avatar)
                                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                                        
                                        Text("\(user.name)")
                                        Spacer()
                                    }
                                })
                        }
            })
            }
            .onAppear
                {
                WebService().loadUsers { (users) in
                    self.users = users
                }
            }
        }
        .navigationBarTitle(Text("User List"), displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
