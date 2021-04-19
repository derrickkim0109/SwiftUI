//
//  ContentView.swift
//  Alignment_iOS13
//
//  Created by Derrick kim on 2021/04/19.
//

import SwiftUI

struct ContentView: View {
    
    
    // Fields
    @State private var width : CGFloat = 90
    @State private var height : CGFloat = 80
    
    var body: some View {
        
        VStack(alignment: .myAlignment){
            HStack(alignment: .bottom){
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width: width, height: height)
                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: width, height: height)
                    .alignmentGuide(.myAlignment, computeValue: { dimension in
                        //100
                        dimension[.leading] + 10
                    })
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: width, height: height)
                Rectangle()
                    .foregroundColor(.black)
                    .frame(width: width, height: height)
            }
            
            Rectangle()
                .foregroundColor(.yellow)
                .frame(width : width, height: 20)
            Rectangle()
                .foregroundColor(.yellow)
                .frame(width : width, height: 20)
                .alignmentGuide(.myAlignment, computeValue: { dimension in
                    dimension[.center]
                })
            Rectangle()
                .foregroundColor(.yellow)
                .frame(width : width, height: 20)
        }
  
    }
}

//  나만의 정렬 만들기
extension HorizontalAlignment{
    
    enum MyAlign : AlignmentID {
        
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            // 방향 정할수 있음
            context[.leading]
        }
        
    }
    
   static let myAlignment = HorizontalAlignment(MyAlign.self)
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
