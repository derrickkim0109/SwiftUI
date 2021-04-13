//
//  ContentView.swift
//  ToggleBasic
//
//  Created by Derrick kim on 2021/04/13.
//

import SwiftUI


struct ContentView: View {
    
    @State private var isOn = false
    
    var body: some View {
        
        Toggle("My Toggle  : \(isOn.description)", isOn: $isOn)
            .toggleStyle(CustomToggle())
            .frame(width: 200, height: 50)
            
            
    }
}

struct CustomToggle:ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
        //Design
        RoundedRectangle(cornerRadius: 100)
            .foregroundColor(configuration.isOn ? .red : .blue)
            .overlay(
                
                // 현재 만든 뷰의 가장 왼쪽 오른쪽값 설정가능.
                GeometryReader(content: { geometry in
                    
//                    geometry.frame(in: .local).minX
                    ZStack{
                        Circle().foregroundColor(configuration.isOn ? .gray : .white)
                            .frame(width: geometry.size.height)
                        Text(configuration.isOn ? "On" : "Off")
                            .foregroundColor(configuration.isOn ? .white : .black)
                    }
                    .offset(x: configuration.isOn ? geometry.frame(in: .local).minX : geometry.frame(in: .local).maxX - geometry.size.height)
                        .animation(.easeInOut(duration:  0.25 ))
                    .shadow(radius: 40 )
                })
              
            )
            .clipShape(Capsule())
            
            .onTapGesture(count: 1, perform: {
                configuration.isOn.toggle()
            })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
