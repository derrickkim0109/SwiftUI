//
//  ContentView.swift
//  DatePicker_iOS13_02
//
//  Created by Derrick kim on 2021/04/16.
//

import SwiftUI

struct ContentView: View {
    
    // Properties
    @State private var selectedDate = Date()
    
    // 범위 선택
    var dateClosedRange  : ClosedRange<Date>{
        
        // ~부터 ~ 까지
        // Value , to
        // day기준으로 -1일전을 기준으로 한다.
         
        let startDate = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        
        let endDate = Calendar.current.date(byAdding: .day, value: 1, to: Date())
        
        return startDate!...endDate!
        
    }
    
    var body: some View {
      
        // 미래 선택X
        // 현재부터 과거까지: ...Date()
        
        // 과거 선택X
        // 과거부터 현재까지: Date()... 과거
        // ...Date() -> dateClosedRange으로 바꿈.
        
        DatePicker(selection: $selectedDate, in: dateClosedRange ) {
            Text("select Date")
        }
        .labelsHidden()
        .datePickerStyle(WheelDatePickerStyle())
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
