//
//  ContentView.swift
//  Image_SF_symbols
//
//  Created by Derrick on 2021/03/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image(systemName: "wifi")
            .resizable()
            .aspectRatio(contentMode: .fit )
            // frame지정 되고 aspectRatio하면 안먹힘.
            .frame(width:100, height: 300)
            .foregroundColor(.gray)
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
