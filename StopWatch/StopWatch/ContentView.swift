//
//  ContentView.swift
//  StopWatch
//
//  Created by Derrick kim on 2021/04/15.
//

import SwiftUI

struct ContentView: View {
    
    // Fields
    
    @State private var time:Double = 0 // 1분,2분,3분... 늘어나는 값 지정을 위해.
    
    var humanReadable : String{
        
        let second = Int(time) % 60
        let secondString = String(format: "%02d", second)
        
        let minute = Int(time) / 60
        let minuteString = String(format: "%02d", minute)
        
        
        
        
        // time % 1 이랑 똑같은 의미
        let milliSecond = time.truncatingRemainder(dividingBy: 1)
        
        let miliString = String(format: "%.1f", milliSecond).split(separator: ".").last ?? "0"
        
        
        
        return  "\(minuteString)" + ":" + "\(secondString)" + ":" + "\(miliString)"
    }
    
    
    
    
    // every = 1 <- 1초
    var timer = Timer.publish(every: 0.1, on: .current, in: .default).autoconnect()
    
    @State private var isStart = false
    
    var body: some View {
        
        VStack{
            ZStack{
                
                ClockTickPoint()
                ClockNumber()
                
                SecondHand(second: time)
                MinuteHand(minute: time)
                CenterCircle()
                    .offset(y:-125)
                    .frame(width: 10, height: 10)
                
                // 틀
                MiliClockTickPoint()
                    .offset(y:15)
                HundredMilliSecondHand(milliSecond: time)
                    .offset(y:15)
                CenterCircle()
                    .offset(y:-62)
                    .frame(width: 5, height: 5)
            } // ---- ZStack
         
            StartStopButton(isStart: $isStart, time: $time)
                
            Text(humanReadable)
                .font(.largeTitle)
                .padding(.top, 20)
                
            
        } // ---- VStack
        // Time이 증가 되는것을 하기위해서는.
        .onReceive(timer, perform: { _ in
            withAnimation {
                if isStart{
                    self.time += 0.1
                }
                
            }
          
        })
    }
}

struct StartStopButton: View {
    
    // Fields
    
    // --> isStart 값에 맞춰서

    @Binding var isStart:Bool
    @Binding var time : Double
    
    var body: some View{
        VStack{
            HStack(spacing: 0){
                Button(action: {
                    isStart = true
                }, label: {
                    Text("Start")
                        .foregroundColor(Color.white)
                        .frame(width: UIScreen.main.bounds.size.width / 2, height: 50)
                        .background(Color.gray)
                })
              
                
                Button(action: {
                    time = 0
                    isStart = false
                }, label: {
                    Text("Stop")
                        .foregroundColor(Color.white)
                        .frame(width: UIScreen.main.bounds.size.width / 2, height: 50)
                        .background(Color.gray.opacity(0.5))
                })
            } // HStacks
            
            Button(action: {
                isStart = false
            }, label: {
                Text("Pause")
                    .foregroundColor(Color.white)
                    .frame(width: UIScreen.main.bounds.size.width, height: 50)
                    .background(Color.black.opacity(0.6))
            })
            
        } // VStack
      
        
    } // The end of the body
}

struct ClockTickPoint:View {
    
    // Fields
    var tickCount = 60
    
    var body: some View {
        
        ZStack{
            
            ForEach(0..<tickCount){ tick in
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 1, height: tick % 5 == 0 ? 20 : 10)
                    .offset(y: 100)//기준점 변경
                    .rotationEffect(.degrees(Double(tick) / Double(tickCount) * 360))// 각도
            }
        }
        .padding(.bottom, 250)
    }
}




struct ClockNumber: View {
    
    // Fields
    var tickCount = 60
    
    var body: some View{
        ZStack{
            ForEach(0..<tickCount){ tick in
                if tick % 5 == 0 {
                    ZStack{
                        Text("\(tick)")
                            .rotationEffect(.degrees(Double(tick) / Double(tickCount) * -360))
                    }
                    .offset(y: -125)
                    .rotationEffect(.degrees(Double(tick) / Double(tickCount) * 360))
                  
                }
            }
        }
        .padding(.bottom, 250)
    }
}

struct SecondHand : View {
    
    // Fields
    var second: Double // 받아와서 정해지는 값.
    private var height : CGFloat = 80
    
    // 내부적으로 사용할려면 이렇게 initialize 해줘야함.
    init(second: Double) {
        self.second = second
    }
    
    var body: some View{
        Rectangle()
            .fill(Color.red)
            .frame(width: 3, height: height)
            .offset(y : -height / 2)
            .rotationEffect(.degrees( second / 60 * 360))
            .padding(.bottom, 250)
    }
}

struct MinuteHand : View {
    
    // Fields
    var minute: Double // 받아와서 정해지는 값.
    private var height : CGFloat = 60
    
    init(minute: Double) {
        self.minute = minute
    }
    
    var body: some View{
        Rectangle()
            .fill(Color.blue)
            .frame(width: 3, height: height)
            .offset(y : -height / 2)
            .rotationEffect(.degrees( minute / 60 / 60 * 360))
            .padding(.bottom, 250)
    }
}

struct MiliClockTickPoint:View {
    
    // Fields
    var miliTickCount = 10
    
    var body: some View {
        
        ZStack{
            
            ForEach(0..<miliTickCount){ tick in
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 1, height: 10)
                    .offset(y: 20)//기준점 변경
                    .rotationEffect(.degrees(Double(tick) / Double(miliTickCount) * 360))// 각도
            }
        }
        .padding(.bottom, 160)
    }
}

struct HundredMilliSecondHand : View {
    
    // Fields
    var milliSecond: Double // 받아와서 정해지는 값.
    private var height : CGFloat = 25
    
    // 내부적으로 사용할려면 이렇게 initialize 해줘야함.
    init(milliSecond: Double) {
        self.milliSecond = milliSecond
    }
    
    var body: some View{
        Rectangle()
            .fill(Color.gray)
            .frame(width: 2, height: height)
            .offset(y : -height / 2)
            .rotationEffect(.degrees( milliSecond / 60 * 60 * 360))
            .padding(.bottom, 155)
    }
}
struct CenterCircle : View {
    
    var body: some View{
        
        Circle()
            .fill(Color.blue)
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
