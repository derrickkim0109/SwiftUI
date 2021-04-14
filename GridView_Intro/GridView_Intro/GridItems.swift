//
//  GridItem.swift
//  GridView_Intro
//
//  Created by Derrick kim on 2021/04/14.
//

import Foundation

struct GridItems : Identifiable{
    
    // Fields
    
    let id = UUID()
    let mainTitle : String
    let subTitle : String
    let imageName : String
    
    
    static var dummyData: [GridItems]{
        
//        // Fields
//        var temp = [GridItem]()
//
//
//
//
//
//        for index in 0...30 {
//            temp.append(
//                GridItem(mainTitle: "Main Title Index\(index)",
//                         subTitle: "Sub Title Index\(index)",
//                         imageName: "venom\(index % 3 + 1)")
//            )
//
//        }
//        return temp
        
        (0...30).map {
            GridItems(mainTitle: "Main Title Index\($0)",
                                subTitle: "Sub Title Index\($0)",
                                imageName: "venom\($0 % 3 + 1)")
                   
        }
    }
}
