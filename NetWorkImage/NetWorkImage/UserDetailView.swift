//
//  UserDetailView.swift
//  NetWorkImage
//
//  Created by Derrick kim on 2021/04/15.
//

import Foundation
import SwiftUI

struct UserDetailView : View {
    
    //fields
    var user: User
    
    var body: some View{
        VStack(){
            URLImage(urlString: user.avatar)
                .frame(width: UIScreen.main.bounds.size.width, height: 250)
            //UIScreen.main.bounds.size.width <- 화면에 꽉차겠다하면.
            
            Text(user.name)
                .font(.largeTitle)
            Text(user.createdAt)
            Spacer()
        }
    }
    
    
}
