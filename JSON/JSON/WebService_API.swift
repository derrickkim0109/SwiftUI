//
//  WebService_API.swift
//  JSON
//
//  Created by Derrick kim on 2021/04/14.
//

import Foundation
//
// "userId": 1,
// "id": 1,
// "title": "delectus aut autem",
// "completed": false

// https://jsonplaceholder.typicode.com/todos

struct Todo : Codable, Identifiable{
    
    // Fields
    
    var userId: Int?
    var id : Int?
    var title : String?
    var completed : Bool?
    
}

class WebService_API{
    
    // Fields

    func getTodos(completion: @escaping ([Todo]) -> Void ) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
            else{
                return
            }
            
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let hasData = data
                else{
                    return
                }
            
            
//
//            do{
//                let todos = try SONDecoder().decode([Todo].self, from: hasData)
//            }catch{
//                print(error)
//            }
            
            // 밑에 data부분을 Optional 안할려면
            // decoder문은 try catch 문으로 써야함
            // catch 안할려면 Unwarpping 하면 됨.
            let todos = try! JSONDecoder().decode([Todo].self, from: hasData)
            
            completion(todos)
        }.resume() // resume 안하면 URLSession은 실행 안됨*****
        
    }
}
