//
//  SingleRowLayout.swift
//  GridView_Intro
//
//  Created by Derrick kim on 2021/04/14.
//

import Foundation
import SwiftUI

struct SingleRowLayout: View {
    
    
    // Fields
    // 굳이 이렇게 할필요없음
//    let mainTitle: String
//    let subTitle: String
//    let imageName:String
    let item : GridItems
    
    var body: some View{
        ZStack{
            Image(item.imageName)
                .resizable()
            VStack{
                Spacer()
                HStack{
                    VStack(alignment: .leading){
                        Text(item.mainTitle)
                            .foregroundColor(.white)
                            .font(.headline)
                            .lineLimit(1)
                        Text(item.subTitle )
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .lineLimit(1)
                    }
                    Spacer()
                }
                .padding(10)
                .background(Color.gray.opacity(0.3))
            }
    
        }
    }
}




struct SingleRowLayout_Previews: PreviewProvider {
    static var previews: some View {
        SingleRowLayout(item: GridItems(mainTitle: "main", subTitle: "sub", imageName: "venom1"))
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/200.0/*@END_MENU_TOKEN@*/))
    }
}
