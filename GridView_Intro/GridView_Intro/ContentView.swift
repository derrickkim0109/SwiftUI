//
//  ContentView.swift
//  GridView_Intro
//
//  Created by Derrick kim on 2021/04/14.
//

import SwiftUI


//  CaseIterable -> case들을 배열화 시키는 것.
enum GridType: CaseIterable {
    case single
    case double
    case triple
    case adaptive
    
    var colunms: [GridItem]{
        
        // switch에서 self는 case별로 잡을수가 있다.
        
        switch self {
        case .single:
            //  .flexible은  minimum, maximum 두개를 설정안하면
            // 최대값으로 설정됨
            return [GridItem(.flexible())]
        case .double:
            return [GridItem(.flexible()),
                    GridItem(.flexible())
            ]
        case .triple:
            return [GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())
            ]
        case .adaptive:
            return [GridItem (.adaptive(minimum: 60))]
        }
    }
    
}

struct ContentView: View {
    
    // Properties
    
    // @State는 이안에서 만 사용가능.
    @State private var selectedGridType : GridType = .single
    
    // image 가져오ㅗ기
    var items = GridItems.dummyData
    
    var body: some View {
        
        VStack{
            GridTypePicker(gridType: $selectedGridType)
            
            ScrollView{
                LazyVGrid(columns: selectedGridType.colunms , content: {
                   
                    ForEach(items) { item in
                        switch selectedGridType{
                        case .single,
                             .double,
                             .triple,
                             .adaptive:
                            SingleRowLayout(item: item)
                            
                        default:
                            Image(item.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        
                    }
                })
                .animation(.default)
            }
        }
   
    }
}

struct GridTypePicker : View {
    
    
    // Properties
    // Binding 해야함
    @Binding var gridType : GridType
    
    
    var body: some View{
        Picker("Grid Type", selection: $gridType) {
            
            ForEach(GridType.allCases, id: \.self) { type in
                switch type{
                case .single:
                    Image(systemName : "rectangle.grid.1x2")
                case .double:
                    Image(systemName : "square.grid.2x2")
                case .triple:
                    Image(systemName : "square.grid.3x2")
                case .adaptive:
                    Image(systemName : "square.grid.4x3.fill")
                }
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        // Picker Style 정할수 있음.
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
