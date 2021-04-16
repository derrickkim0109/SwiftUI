//
//  ContentView.swift
//  List_iOS13
//
//  Created by Derrick kim on 2021/04/16.
//

import SwiftUI


// Model
struct LocationInfo: Identifiable {
    
    var id = UUID() // 난수. 랜덤생성
    var city = ""
    var weather = ""
    
    var cityPresenter: some View {
        return Text(city)
    }
    
    func cityPresenterWithIndex(_ index : Int) -> some View {
        Text("\(index + 1)." + city)
    }
    
}


struct ContentView: View {
    
    // -Field
    
    var locations = [
        LocationInfo(city: "Seoul", weather: "Sunny"),
        LocationInfo(city: "Busan", weather: "Rainy"),
        LocationInfo(city: "Seoul", weather: "Sunny"),
        LocationInfo(city: "Busan", weather: "Rainy"),
        LocationInfo(city: "Seoul", weather: "Sunny"),
        LocationInfo(city: "Busan", weather: "Rainy"),
        LocationInfo(city: "Seoul", weather: "Sunny"),
        LocationInfo(city: "Busan", weather: "Rainy")
    ]
    
    var body: some View {
        
        List{
            ForEach(locations){ location in
                
                HStack{
                    location.cityPresenter
                }
             
            }
            
            ForEach(0..<locations.count) { index in
//                Text("\(index + 1). " + self.locations[index].city )
                locations[index].cityPresenterWithIndex(index)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
