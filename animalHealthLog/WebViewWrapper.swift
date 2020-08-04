//
//  UseWebView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/05/26.
//  Copyright © 2020 Seiya. All rights reserved.
//

import Foundation
import  SwiftUI
import WebKit


class WebViewStateModel:ObservableObject{
    @Published var pageTitle:String = "Web View"
    @Published var loading:Bool = false
    @Published var canGoBack:Bool = false
    @Published var goBack:Bool = false
}

enum NavigationAction{
    case decidePolicy(WKNavigationAction,(WKNavigationActionPolicy) -> Void)
    case didRecieveAuthChallenge(URLAuthenticationChallenge,(URLSession.AuthChallengeDisposition,URLCredential?) -> Void)
    case didStartProvisionalNavigation(WKNavigation)
    case didReceiveServerRedirectForProvisionalNavigation(WKNavigation)
    case didCommit(WKNavigation)
    case didFinish(WKNavigation)
    case didFailProvisionalNavigation(WKNavigation,Error)
    case didFail(WKNavigation,Error)
}

final class WebViewWrapper:UIViewRepresentable{
    @ObservedObject var webViewStateModel:WebViewStateModel
    let action:((_ NavigationAction:WebView.NavigationAction) -> Void)?
    
    let request:URLRequest
    
    init(webViewStateModel:WebViewStateModel,
         action:((_ navigationAction:WebView.NavigationAction) -> Void)?,
         request:URLRequest)
    {
    self.action = action
    self.request = request
    self.webViewStateModel = webViewStateModel
    }
    
    func makeUIView(context:Context) -> WKWebView{
        let view = WKWebView()
        view.navigationDelegate = context.coordinator
        view.load(request)
        return view
    }//makeUIView
    
    func updateUIView(_ uiView:WKWebView,context:Context){
        if uiView.canGoBack,webViewStateModel.goBack{
            uiView.goBack()
            webViewStateModel.goBack = false
        }//if
    }//updateUIView
    
    func makeCoordinator() -> Coordinator{
        return Coordinator(action:action,webViewStateModel:webViewStateModel)
    }//makeCoordinator
    
    final class Coordinator:NSObject{
        @ObservedObject var webViewStateModel:WebViewStateModel
        let action:((_ navigationAction:WebView.NavigationAction) -> Void)?
        
        init(action:((_ NavigationAction:WebView.NavigationAction) -> Void)?,
             webViewStateModel:WebViewStateModel){
            self.action = action
            self.webViewStateModel = webViewStateModel
        }//init
    }//Coordinator
    }//class

    extension WebViewWrapper.Coordinator:WKNavigationDelegate{
        func webView(_ webView:WKWebView,decidePolicyFor navigationAction:WKNavigationAction,decisionHandler:@escaping(WKNavigationActionPolicy) -> Void){

            if action == nil{
                decisionHandler(.allow)
            }else{
                action?(.decidePolicy(navigationAction,decisionHandler))
            }

        }//webView

        func webView(_ webView:WKWebView,didStartProvisionalNavigation navigation:WKNavigation!) {
            webViewStateModel.loading = true
            action?(.didStartProvisionalNavigation(navigation))
        }//webView

        func webView(_ webView:WKWebView,didReceiveServerRedirectForProvisionalNavigation navigation:WKNavigation!){
            action?(.didReceiveServerRedirectForProvisionalNavigation(navigation))
        }//webView

        func webView(_ webView:WKWebView,didFailProvisionalNavigation navigation:WKNavigation!,withError error:Error){
            webViewStateModel.loading = false
            webViewStateModel.canGoBack = webView.canGoBack
            action?(.didFailProvisionalNavigation(navigation,error))
        }//webView

        func webView(_ webView:WKWebView,didCommit navigation:WKNavigation!)  {
            action?(.didCommit(navigation))
        }//webView

        func webView(_ webView:WKWebView,didFinish navigation:WKNavigation!){
            webViewStateModel.loading = false
            webViewStateModel.canGoBack = webView.canGoBack
            if let title = webView.title{
                webViewStateModel.pageTitle = title
            }//if
            action?(.didFinish(navigation))
        }//webView

        func webView(_ webView:WKWebView,didFail navigation:WKNavigation!,withError error:Error){
            webViewStateModel.loading = false
            webViewStateModel.canGoBack = webView.canGoBack
            action?(.didFail(navigation,error))
        }//webView

        func webView(_ webView:WKWebView,didReceive challenge:URLAuthenticationChallenge,completionHandler:@escaping(URLSession.AuthChallengeDisposition,URLCredential?) -> Void)
        {
            if action == nil {
                completionHandler(.performDefaultHandling,nil)
            }//if
            else{
                action?(.didRecieveAuthChallenge(challenge,completionHandler))
            }//else
        }//webView
    }


