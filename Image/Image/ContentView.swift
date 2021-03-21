//
//  ContentView.swift
//  Image
//
//  Created by Derrick on 2021/03/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        // spacing: 0 은 사진 두개가 딱 붙게 만든다.
        VStack(spacing: 0){
            Text("Hello~~~~")
                .background(Color.blue)
            Text("Hello~~~~")
                .background(Color.blue)
            Image("mountain")
                .resizable()
                // height or weight 지정 안하면 전체크기만큼 잡힘.
                //.frame(height:300)
                //.padding()
                .edgesIgnoringSafeArea(.all)
                .aspectRatio(contentMode: .fit)
                
                .mask(
                    HStack(spacing:0){
                        VStack(spacing:0){
                            Circle()
                            Circle()
                            Circle()
                        }
                        VStack(spacing:0){
                            Circle()
                            Circle()
                            Circle()
                        }
                        VStack(spacing:0){
                            Circle()
                            Circle()
                            Circle()
                        }
                        VStack(spacing:0){
                            Circle()
                            Circle()
                            Circle()
                        }
                    }
                )
                .frame(width: 300, height:300)
                //.padding(.bottom,50)
            // 순서를 잘기억 해야함. 사진이 안짤리도록
        //fit은 원본 비율 유지. fill 화면 전체를 채워서 영역을 넘어감.
            
            Image("mountain")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .aspectRatio(contentMode: .fit)
        }
         
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
