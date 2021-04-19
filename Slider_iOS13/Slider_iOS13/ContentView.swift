//
//  ContentView.swift
//  Slider_iOS13
//
//  Created by Derrick kim on 2021/04/19.
//

import SwiftUI

struct ContentView: View {
    
    
    // Fields
    @State private var progressValue : Float =  0
    var sliderRange : ClosedRange<Float> {
        return 0...100
    }
    
    
    var body: some View {

        VStack{
            HStack{
                Image(systemName: "minus")
                    .onTapGesture {
                        self.progressValue -=  1
                    }
                Slider(value: $progressValue, in: sliderRange)
                Image(systemName: "plus")
                    .onTapGesture {
                        self.progressValue += 1
                    }
            }.padding(20)
                
                Text("\(Int(progressValue))")
                    .font(.largeTitle)
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

