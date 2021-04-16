//
//  ContentView.swift
//  List_iOS13_02
//
//  Created by Derrick kim on 2021/04/16.
//

import SwiftUI

struct ContentView: View {
    
    @State private var users = ["kim", "min", "lee", "su"]
    
    
    var body: some View {
        NavigationView{
            List{
                Section(header:
                            Text("Head")
                            .font(.largeTitle)
                            
                ) {
                    ForEach(users, id: \.self) { name in
                        Text(name)
                    }
                    .onDelete(perform: deleteItem)
                    // prepare 처럼 선택한 줄의 index값.
                    .onMove(perform: moveItem)
                }
               
                
            }
            .navigationBarItems(leading: EditButton())// onMove를 실행
//            .navigationBarItems(trailing:
//
//                                    Button(action: {
//                                        self.users.append("new name")
//                                    }, label: {
//                                        Image(systemName: "plus")
//                                    })
//            )
//            .navigationBarTitle("List")
        }
       
        
    }
    
    // onMove 기능을 따로 funcion으로 뺌.
    func moveItem(idx : IndexSet, int : Int ){
        self.users.move(fromOffsets: idx, toOffset: int)
    }
    
    // onDelete
    func deleteItem(idx : IndexSet){
        if let findIndex = idx.first
        {
            self.users.remove(at: findIndex)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
