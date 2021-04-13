//
//  ContentView.swift
//  Grid
//
//  Created by Derrick kim on 2021/04/13.
//

import SwiftUI

// Grid
// Collection View.
// 바둑판 느낌.

struct ContentView: View {
    
    //-------------
    // Properties
    //-------------
    var columns: [GridItem]{
        [GridItem(.fixed(100))
        //.adaptive(minimum:  90, maximum: 400)
//         GridItem(.flexible(minimum: 50, maximum: 200))
         // .adaptive는 minimum으로 됨.
         // .flexible은 값이 많을 수록 작아짐. 제일 커질수 있는 maximum으로 커짐
         // .fixed는 값이 계속 큰상태
//         GridItem(.fixed(50))
        ]
        // width값이 고정되는것이다.
    }
    
    
    var body: some View {
        ScrollView(.vertical){
            
        
            //LazyHGrid(rows: columns , content:  <- .horizontal
        LazyVGrid(columns: columns, content: {
            Text("Hi, My name is Derrick")
                .lineLimit(1)
            
            
            Image(systemName: "music.mic")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Image(systemName: "music.mic")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Image(systemName: "music.mic")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Image(systemName: "music.mic")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            
            Image(systemName: "music.note")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Image(systemName: "music.mic")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Image(systemName: "music.mic")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Image(systemName: "music.mic")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
        })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
