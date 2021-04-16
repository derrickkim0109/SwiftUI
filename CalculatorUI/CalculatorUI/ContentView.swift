//
//  ContentView.swift
//  CalculatorUI
//
//  Created by Derrick kim on 2021/04/15.
//

import SwiftUI

struct CalcButton : View {
    
    // Fields
    var buttonName = ""
    
    
    var body: some View {
        Circle()
            .foregroundColor(.gray)
            .overlay(
                Text(buttonName)
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    
            )
    }
}


struct ContentView: View {
    
    // Fields
    @State private var geoCircleHeight: CGFloat = 50
    @State private var displayNumber: String = "0"
    
    @State private var touchTypingBool = false
    
    var calcCore = CalcLogic()
   
    let data = [
        ["AC", "+-", "%", "÷"],
        ["7", "8", "9", "x"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ".", "="]
    ]
    
    
    
    var body: some View {
        VStack(spacing:10){
            
            // 숫자판 다 밑으로 내리기위해
            Spacer(minLength: 50)
            
            Text(displayNumber)
                .font(.largeTitle)
                .padding(.trailing, 10)
                .frame(width: UIScreen.main.bounds.size.width,alignment: .trailing)
                
            
            ForEach (0..<4) { firstIndex in
                
                HStack{
                    // 맨처음 부분.(왼쪽)
                    ForEach (0..<4) { secondIndex in
                        
                        // 1. Button 에 Action넣는 방법.
                        
                        Button(action: {
                            // data[firstIndex][secondIndex] String값.
                            calcAction(symbol : data[firstIndex][secondIndex])
                        }, label: {
                            CalcButton(buttonName: data[firstIndex][secondIndex])
                                
                                // width와 height의 관계
                                // 1은 1:1 2는 2:1 // 0.5는 1:2 관계.
                                // CGFloat
                                .aspectRatio(1, contentMode: .fit)
                                
                                
                        })
                        
                        
                        
//                        // 2. TapGesture 기능 활용.
//                        CalcButton(buttonName: data[firstIndex][secondIndex])
//                            // width와 height의 관계
//                            // 1은 1:1 2는 2:1 // 0.5는 1:2 관계.
//                            // CGFloat
//                            .aspectRatio(1, contentMode: .fit)
//                            .onTapGesture(count: 1, perform:{
//                                calcAction()
//                            })
                    }
                }
                
                .padding(.horizontal, 10)
                
            }
            
            //--------------------------------------------
            // Button 이랑 구분을 위해 onTapGesture를 사용.
            //--------------------------------------------
            
            // Last Line
            HStack(spacing: 10){
                GeometryReader(content: { geometry in
                    
                    Capsule()
                        .foregroundColor(.gray)
                        // CGSize
                        // 16:9 비율
                        // + 10 은 spacing 값이다.
                        .aspectRatio(CGSize(width: geometry.size.height * 2 + 10, height: geometry.size.height), contentMode: .fit)
                        // Text 넣을거다.
                        .overlay(
                            Text(data[4][0])
                                .font(.largeTitle)
                                .foregroundColor(Color.white)
                        )
                        .onAppear{
                            self.geoCircleHeight = geometry.size.height
                        }
                        .onTapGesture(count: 1, perform: {
                            calcAction(symbol: data[4][0])
                        })
                        
                })
           
                CalcButton(buttonName: data[4][1])
                    // CGFloat
                    .aspectRatio(1, contentMode: .fit)
                    .onTapGesture(count: 1, perform: {
                        calcAction(symbol: data[4][1])
                    })
                CalcButton(buttonName: data[4][2])
                    // CGFloat
                    .aspectRatio(1, contentMode: .fit)
                    .onTapGesture(count: 1, perform: {
                        calcAction(symbol: data[4][2])
                    })
            }
            // CGSize
            // CGFloat일때는 단지 height의 4배로 만썻찌만
            // spacing : 10이므로 3개
            .aspectRatio(CGSize(width: geoCircleHeight * 4 + 30, height: geoCircleHeight), contentMode: .fit)
            .padding(.horizontal, 10)
        }
        .padding(.bottom,10)
    }
    
    func calcAction(symbol: String){
        
        
        
        //------------
        // 이게 String은 Int로 변환이 안되니까 숫자만 따로 걸러짐.
        //------------
        
        if Int(symbol) != nil {
            
            if touchTypingBool {
                displayNumber = displayNumber + symbol
                
            }else{
                touchTypingBool = true
                displayNumber = symbol
            }
            if calcCore.remeberSymbol == nil {
                calcCore.digit1 = Double(displayNumber)
            }else{
                calcCore.digit2 = Double(displayNumber)
            }
        }
        
        //------------
        // 숫자가 아닌경우
        //------------
        else{
            
            if symbol != "=" {
                calcCore.remeberSymbol = symbol
            }
            
            
            touchTypingBool = false
            
            if symbol == "=" && calcCore.digit2 != nil {
                displayNumber = "\(calcCore.calcLogic()!)"
            }else if calcCore.digit2 == nil  {
                displayNumber == displayNumber
            } else{
                
                calcCore.digit1 == calcCore.digit2
                displayNumber = "\(calcCore.calcLogic()!)"
                
            }
            
            if symbol == "AC" {
                displayNumber = "0"
                calcCore.digit1 = nil
                calcCore.digit2 = nil
                calcCore.calculationResult = nil
                calcCore.remeberSymbol = nil
                
            }
            
            if symbol == "%"  {
                displayNumber = "\(String(describing: calcCore.calcLogic()!))"
                calcCore.digit1 = Double(displayNumber)
            }
            
            if symbol == "+-" {
                displayNumber = "\(String(describing: calcCore.calcLogic()!))"
            }
            
            
            
            
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
