//
//  ContentView.swift
//  ProgressBar
//
//  Created by Derrick kim on 2021/04/15.
//

import SwiftUI

struct ContentView: View {
    
    // Fields
    @State private var progress: CGFloat = 0
    
    
    var body: some View {
        VStack{
            Slider(value: $progress)
            
            CircularProgressBar(progress: $progress)
            CircularProgressBar(progress: $progress)
            CircularProgressBar(progress: $progress)
        }
        
      
  
    }
}


struct CircularProgressBar : View {
    
    // Fields
    @Binding var progress : CGFloat
    
    var body: some View{
        ZStack{
            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: 20)
            
            Circle()
                .trim(from: 0, to: progress)
//                    .stroke(Color.red, lineWidth: 20)
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .fill(progress == 1 ? Color.green : Color.red)
                .rotationEffect(.degrees(-100))
                .animation(.easeInOut)
            
            Text("\(String(format: "%.2f", (progress * 100)))" + "%")
                .foregroundColor(progress == 1 ? Color.green : Color.red)
                .font(.largeTitle)
        }
        .padding(30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
