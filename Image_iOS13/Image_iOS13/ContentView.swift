//
//  ContentView.swift
//  Image_iOS13
//
//  Created by Derrick kim on 2021/04/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        ZStack(){
//            Image("planet")
//                .resizable()
//                .edgesIgnoringSafeArea(.all)
//                .aspectRatio(contentMode: .fit)
//            VStack{
//
//                Text("Hello Picture")
//                    .font(.largeTitle)
//                    .foregroundColor(Color.white)
//                    .offset(x:100,y: 20)
//
//            }
//
//        }
                
            Text("Hello Picturesdsadsasd
                ")
                .foregroundColor(Color.white)
                .font(.largeTitle)
                .fixedSize()
                .padding(.leading,20)
                .padding(.trailing,10)
                .padding(.top,10)
                .padding(.bottom,10)
                .background(
                    
                    Image("chatbot")
                        .resizable(capInsets: .init(top: 70, leading: 10, bottom: 150, trailing: 10), resizingMode: .stretch)
                        
                )
        
                
        
//        .background(
//            Image("nine-patch")
//                .resizable(capInsets: .init(top: 100, leading: 0, bottom: 0, trailing: 0), resizingMode: .tile)
////                .aspectRatio(contentMode: .fit)
////                .edgesIgnoringSafeArea(.all)
//        )
//        .background(
//            Image("chatbot")
//                .resizable(capInsets: .init(top: 50, leading: 50, bottom: 50, trailing: 50), resizingMode: .stretch)
////                .aspectRatio(contentMode: .fit)
////                .edgesIgnoringSafeArea(.all)
//        )
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
