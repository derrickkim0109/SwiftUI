//
//  ContentView.swift
//  List_ForEach
//
//  Created by Derrick on 2021/03/23.
//

import SwiftUI


struct LocationInfo : Hashable, Identifiable {
    var id: ObjectIdentifier
    
    // ------------
    // Properties
    // ------------
    var city = ""
    var weather = ""
}


struct ContentView: View {
    
    // ------------
    // Properties
    // ------------
    
    @State private var locations = [
        LocationInfo.init(city: "Seoul", weather: "Sunny"),
        LocationInfo.init(city: "Busan", weather: "Cloudy"),
        LocationInfo.init(city: "Jinju ", weather: "Rainy"),
        LocationInfo.init(city: "Busan", weather: "Cloudy")
    ]
    
    // \.self 는 위의 배열 값 하나하나를 고유의 값으로 사용하겠다는 의미이다.
    // id 는 하나하나의 개념으로 구분을 하겠다 했을때.
    var body: some View {
        List{
            
            // 첫번째 ForEach
            ForEach(locations , id: \.self){ location in
                HStack{
                    Text("\(location.city)")
                    Text("\(location.weather)")
                }
            }
            // 두번째 ForEach
            ForEach(locations){ location in
                HStack{
                    Text("\(location.city)")
                    Text("\(location.weather)")
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
