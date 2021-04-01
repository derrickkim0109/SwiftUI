//
//  ContentView.swift
//  ViewModifier
//
//  Created by Derrick on 2021/03/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Text("Main Title")
                .font(.largeTitle)
                .foregroundColor(.black )
                .bold()
             
            Text("Sub Title")
                .modifier(MyTextStyle(myWeight: .bold, myFont: .title))
            
            Text("Description")
                .modifier(MyTextStyle(myWeight: .bold, myFont: .title2, myColor: .red))
            
            Text("Description2")
                .customFont(color: .gray)
        }
        
    }
}

// 똑같은 설정을 최대한 줄이기 위해
// ViewModifier 에서는 italic 체를 사용할수없다.
struct MyTextStyle: ViewModifier {
    
    var myWeight = Font.Weight.regular
    
    var myFont = Font.title3.weight(.bold)
    
    var myColor = Color.black
    
    func body(content: Content) -> some View {
        
        content
            .font(myFont.weight(myWeight))
            .foregroundColor( myColor)
            .padding(.bottom, 20)
        
    }
}
// italic, bold 넣고싶으면 extension을 쓴다
// 따로 struct로 설정해서 안되는 경우 extension을 활용한다.
extension Text{
    func customFont(color : Color) -> Text {
        self
            .font(.title2)
            .bold()
            .italic()
            .foregroundColor(color)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
