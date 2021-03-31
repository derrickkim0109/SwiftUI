//
//  ContentView.swift
//  ListSection
//
//  Created by Derrick on 2021/03/26.
//

import SwiftUI

// List Section

// 1. 기본 구조
// 2. data 가공 (원하는 형태로 표현)

struct Animal: Identifiable{
    
    // ---
    // Properties
    // ---
    let id = UUID()
    let name : String
    let index : Int
    
}



struct ContentView: View {
    // ---
    // Properties
    // ---
    
    var animalList = [
        Animal(name: "dog", index: 1),
        Animal(name: "bird", index: 7),
        Animal(name: "cat", index: 4),
        Animal(name: "dog", index: 2),
        Animal(name: "cat", index: 6),
        Animal(name: "bird", index: 8),
        Animal(name: "dog", index: 3),
        Animal(name: "cat", index: 5),
        Animal(name: "bird", index: 9)
    ]
    // Animal의 name 으로 묶고 싶을 경우
    // Dictionary를 사용.
    // dog: [dog, dog, dog]
    
    // Type 은 지정을 꼭 해줘야함.
    var animalGrouping : [String : [Animal]] {
        
        // sort 먼저 하는 법. 위의 Array가 순서가 안맞아서
        // Grouping 전에 한다.
        
        var groupData = Dictionary(grouping: animalList) { $0.name }
        
        for(key, value) in groupData{
            groupData[key] = value.sorted(by: { $0.index > $1.index })
            
            // '<' 오름차순의 의미임.
            // '>' 내림차순의 의미.
            
        }
        
        return groupData
    }
    
    // Group Key를 지정해줘야함. 위의것을 가져오기위해
    var groupKey:[String]{
        animalGrouping.map( { $0.key } )
    }
    // dictionary [somekey] = value를 가져오는것이다.
    
    
    
    var body: some View {
        List{
            ForEach(groupKey, id : \.self) { animalKey in
                Section(header: Text("\(animalKey)")) {
                    // Section 안의 row를 표현해야함.
                    // row 는 하나가 아니라 여러개라.
                    ForEach(animalGrouping[animalKey]!) { animal in
                        HStack{
                            Text("\(animal.name)")
                            Text("\(animal.index)")
                        }
                        
                    }
                    
                }
            }
        }
    }
}


//// header
//Section(header: Image(systemName: "trash") ) {
//    Text("A")
//    Text("A")
//    Text("A")
//}
//
//// buttom
//Section(footer: Image(systemName: "trash") ) {
//    Text("A")
//    Text("A")
//    Text("A")
//}
//Section(header: Text("header"), footer: Text("footer") ) {
//    Text("A")
//    Text("A")
//    Text("A")
//}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
