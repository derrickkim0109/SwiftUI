//
//  ContentView.swift
//  Shape
//
//  Created by Derrick on 2021/03/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            VStack{
                // 첫번째
                Rectangle()
                    .fill(Color.blue) //설정 없으면 화면 다 채울수 있도록 되기때문에 frame해야함
                   // .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                // 두번째
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.red)
                 //   .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                // 세번째
                Circle()
                    .fill(Color.gray)
                  //  .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                // 네번째
                // 크기가 늘어날수 있는 Circle
                Capsule()
                    .fill(Color.orange)
                   // .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                // 다섯번째
                // Capsule이 늘어나는것이랑은 다르다. - 타원형
                Ellipse()
                    .fill(Color.pink)
                   // .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .frame(width: 200, height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            // 테두리 선.
            VStack{
                Rectangle()
                    .stroke(Color.blue, lineWidth: 10)
                
                RoundedRectangle(cornerRadius: 25.0)
                    .stroke(Color.red, style: StrokeStyle(lineWidth:10,lineCap: .butt, dash: [50,10],dashPhase: 20))
                    
                    // dashPhase: 위치 회전 시킴.
                    // lineCap : 그냥 합쳐지는 선이 달라짐.
                
                Capsule()
                    .stroke(Color.gray, style: StrokeStyle(lineWidth: 10, lineCap: .butt, lineJoin: .bevel, dashPhase: 10)
                // lineJoin에서 .miter로 하면 miterLimit이라는것을 하나더 적어서 설정을 따로 해주어야 모서리 부분이 값에 따라 깍임.
            )}
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
     
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
