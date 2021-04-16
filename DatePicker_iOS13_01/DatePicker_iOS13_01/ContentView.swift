//
//  ContentView.swift
//  DatePicker_iOS13_01
//
//  Created by Derrick kim on 2021/04/16.
//

import SwiftUI


struct ContentView: View {
    
    @State var selectedDate = Date() //현재 날짜.
    
    var presentDateStyle: String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일 HH:mm:ss"
        return  formatter.string(from: selectedDate)
    }
    
    
    
    var body: some View {
        
        VStack{
            DatePicker(selection: $selectedDate) {
                Text("Selected Date")
            }
            .datePickerStyle(WheelDatePickerStyle())
            .labelsHidden()
            
            Text("\(selectedDate.timeIntervalSince1970)")
            Text(presentDateStyle)
        }
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
