//
//  WebViewControllerr.swift
//  WebView_JS_Bridge
//
//  Created by Derrick kim on 2021/04/13.
//
import Foundation
import UIKit
import WebKit

class WebViewController: UIViewController,WKScriptMessageHandler {

    
    // --------------
    // Properties
    // --------------
    var webView:WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contentController = WKUserContentController()
        contentController.add(self, name: "iPhoneInfo")
        
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = contentController
        
        
        webView = WKWebView(frame: self.view.bounds, configuration: configuration)
        
        // extension 사용을 위해
        webView.navigationDelegate = self
        webView.uiDelegate = self
        
        self.view.addSubview(webView)
        
        // file load
        let localFile = Bundle.main.path(forResource: "TestWeb", ofType: "html")
        let url = URL(fileURLWithPath: localFile!)
        let request = URLRequest(url: url)
        
        webView.load(request)
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        // Break Point 기능 써서
        // po message.name 쳐보면 나옴. -> 값이 뭔지 확인가능
        // po message.body -> 값이 뭔지 확인가능
        if message.name == "iPhoneInfo" {
            print("call native")
        }
    }
    
}


// 1.
extension WebViewController : WKNavigationDelegate{
    // webview 화면이 로딩이 다 끝마쳤을 경우 사용할 함수
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.evaluateJavaScript("showAlert('Hello, my name is Derrick Kim')", completionHandler: nil)
    }
}

// Alert는 자동으로 되는 부분이 아니라서 정의를 따로 해주어야함
// 2.
extension WebViewController : WKUIDelegate{
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alertController = UIAlertController(title: "js test", message: message, preferredStyle: .alert)
        let doneAction = UIAlertAction(title: "conflict", style: .default) { _ in
            completionHandler()
        }
        
        alertController.addAction(doneAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
