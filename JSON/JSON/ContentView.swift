//
//  ContentView.swift
//  JSON
//
//  Created by Derrick kim on 2021/04/14.
//

import SwiftUI

//  JSON
// https://jsonplaceholder.typicode.com/todos


struct ContentView: View {
    
    // Fields
//    @State var todos: [Todo]
    @State var todos = [Todo]() // initialize
    
    
    var body: some View {
        
        List(todos){ todo in
            VStack(alignment: .leading){
                Text(todo.title!)
                    .padding(.bottom, 10)
                Text(todo.completed!.description)
                    .foregroundColor(todo.completed! ? .blue : .red)
            }
        }
        // 리스트가 갖춰지면 그다음 액션부분.// 리스트가 갖춰지면 그다음 액션부분.
        .onAppear {
            WebService_API().getTodos { todos in
                self.todos = todos
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
