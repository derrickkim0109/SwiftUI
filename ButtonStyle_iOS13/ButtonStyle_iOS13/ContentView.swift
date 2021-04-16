//
//  ContentView.swift
//  ButtonStyle_iOS13
//
//  Created by Derrick kim on 2021/04/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Button(action: {
                print("selected")
            }) {
                HStack{
                    Image(systemName: "square.and.pencil")
                        .font(.largeTitle)
                    Text("Edit")
                        .font(.largeTitle)
                }
            }
            .buttonStyle(MyCustomButtonStyle())
            
            Button(action: {
                print("Btn 2")
            }, label: {
                Text("Hi 222222")
            }).buttonStyle(MyCustomButtonStyle())
        }
        
    }
}

// Button Style을 따로 빼서 만든다!
struct MyCustomButtonStyle : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .foregroundColor(.white)
        .padding(20)
            //.background(Color.blue)// 배경 색
        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(20)
            //isPressed 눌렀을경우. 
            .scaleEffect(configuration.isPressed ? 0.8 : 1)// 크기 줄이는것.
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
