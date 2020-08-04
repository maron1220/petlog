//
//  WebView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/05/13.
//  Copyright © 2020 Seiya. All rights reserved.
//

//import SwiftUI
//import WebKit
//
//class WebViewController:UIViewController,WKUIDelegate{
//
//    var webViewFirst:WKWebView!
//
//    override func loadView() {
//        let webConfiguration = WKWebViewConfiguration()
//        webView = WKWebView(frame:.zero,configuration: webConfiguration)
//        webView.uiDelegate = self
//        view = webView
//    }
//
//    override func viewDidLoad() {
//
//            super.viewDidLoad()
//
//            let myURL = URL(string: "https://senzyuchannel.com")
//            let myRequest = URLRequest(url: myURL!)
//            webView.load(myRequest)
//    }
//
//    func GoBack(){
//        webView.goBack()
//    }
//}
//
//struct WebViewFirst: UIViewRepresentable {
//    var loadUrl:String
//    
//    func makeUIView(context: Context) -> WKWebView {
//        return WKWebView()
//    }
//    func updateUIView(_ uiView: WKWebView, context: Context) {
//        uiView.load(URLRequest(url: URL(string: loadUrl)!))
//    }
//    
//    func webGoBack(_ uiView:WKWebView,context:Context)  {
//        uiView.goBack()
//    }
//}

//struct WebView_Previews: PreviewProvider {
//    static var previews: some View {
//        WebView(url:URL(string:"https://senzyuchannel.com")!)
//    }
//}
