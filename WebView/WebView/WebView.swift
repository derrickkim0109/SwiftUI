//
//  WebView.swift
//  WebView
//
//  Created by Derrick kim on 2021/04/13.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    
    // -----------
    // Properties
    // -----------
    var url:String
    
    // -----------
    // Functions
    // -----------
    
    
    func makeUIView(context: Context) ->
        some UIView {
        
        let url = URL(string: self.url)
        let urlRequest = URLRequest(url: url!)
        
        
        let wkWebView = WKWebView()
        wkWebView.load(urlRequest)
        
        
        return wkWebView
    }
    
    
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    
    }
}


// UIViewController -> Swift UI 쪽으로 연결해서 사용하는 법
// interface
struct MyWebVC: UIViewControllerRepresentable{
    
    func makeUIViewController(context: Context) ->
      some UIViewController {
        
        let webVC = UIStoryboard(name: "WebViewController", bundle: nil).instantiateViewController(identifier: "WebViewController") as! WebViewController
        // Storyboard id 설정해둔걸 쓰는것임.
        
        let navi = UINavigationController(rootViewController: webVC)
        
        return navi
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
