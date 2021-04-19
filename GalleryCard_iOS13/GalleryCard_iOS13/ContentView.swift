//
//  ContentView.swift
//  GalleryCard_iOS13
//
//  Created by Derrick kim on 2021/04/19.
//

import SwiftUI


// \.self를 사용할려면 Hashable 이라는 Type으로 해야함.
struct GalleryItem : Hashable {
    // Fields
    var color : Color
    var title : String
}


struct ContentView: View {
    
    // Fields
    var items = [
        GalleryItem(color: .red, title: "title1"),
        GalleryItem(color: .blue, title: "title2"),
        GalleryItem(color: .gray, title: "title3"),
        GalleryItem(color: .green, title: "title4"),
        GalleryItem(color: .yellow, title: "title5"),
        GalleryItem(color: .orange, title: "title6"),
        GalleryItem(color: .pink, title: "title7")
    
        
    ]
    var itemSize = CGSize(width: 100, height: 100)
    var scrollViewSize = CGSize(width: 400, height: 300)
    
    var leadingPadding : CGFloat{
        scrollViewSize.width / 2 - itemSize.width / 2
    }
    
    
    var body: some View {
        VStack(spacing:0){
            
            makeGallery()
            makeGallery()
            makeGallery()
        }
        .padding(.top,100)
        
    }
    
    func makeGallery() -> some View {
        GeometryReader { scrollGeometry in
            ScrollView(.horizontal,
                       showsIndicators: false){
                HStack(spacing:50){
                ForEach(items, id: \.self) { item  in
                    
                    GeometryReader{ geometry in
                        
                        ZStack{
                            Rectangle()// 네모 만들기
                                .frame(width: self.itemSize.width, height: self.itemSize.height)
                             .foregroundColor(item.color)
                          
                            VStack{
                                Spacer()
                                Text(item.title)
                                    .padding(.bottom,10)
                            }
                            
                        }
                        .rotation3DEffect( // 45도
                            .degrees((Double(geometry.frame(in: .global).minX - self.leadingPadding) - Double(scrollGeometry.frame(in: .global).minX)) / 3),
                            axis: (x: 0, y: -1, z: 0))
                    
                    // GeometryReader는 해당되는 프레임 값 처리를 똑같이 해줘야 처리할수 있음.
                        // print
                            self.testFunc(geometry: geometry)
                             
                        
                        
                    
                    } // GeometryReader
                    .frame(width: self.itemSize.width, height: self.itemSize.height)
                }//ForEach
                    
                } // HStack
                .padding(.vertical, 50)
                .padding(.leading, self.leadingPadding) // 앞부분
                .padding(.trailing, self.leadingPadding) // 뒷부분.
            } // ScrollView
            .background(Color.gray.opacity(0.3))
        } // GeometryReader
        .frame(width: self.scrollViewSize.width, height: self.scrollViewSize.height)
      
    }
    
    
    func testFunc(geometry : GeometryProxy) -> some View{
        print(geometry.frame(in: .global).minX)
        // minX 는 x좌표 minY는 y좌표

        return Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
