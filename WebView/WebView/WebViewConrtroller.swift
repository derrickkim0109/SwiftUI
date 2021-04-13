//
//  WebViewConrtroller.swift
//  WebView
//
//  Created by Derrick kim on 2021/04/13.
//

import Foundation
import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate{
    
    // ----------
    // Properties
    // -----------
    
    @IBOutlet var webView: WKWebView!
    var url = "https://google.com"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView.navigationDelegate = self
        self.webView.load(URLRequest(url: URL(string: url)!))
    }
    
    // ----------
    // Functions
    // -----------
    
    // WebView가 다불러지면 사용하게될 Function.
    // WebView가 로딩 끝난 시점.
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        // get webView Title
        // 로딩전 처음에 가져올려고 하면 못가져오는 경우가 있음.
        self.webView.evaluateJavaScript("document.title") {
            (result,error) in // 반환되는 값
            // navigation일 경우는 self.title있음
            // ViewController라
            self.navigationItem.title = result as? String
        }
    }
    
    
}
