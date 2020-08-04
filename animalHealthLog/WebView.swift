//
//  WebView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/05/26.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView: View {
    
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

    @ObservedObject var webViewStateModel:WebViewStateModel
    
    private var actionDelegate:((_ navigationAction:WebView.NavigationAction) -> Void)?
    
    let uRLRequest:URLRequest
    
    var body: some View {
        WebViewWrapper(webViewStateModel: webViewStateModel, action: actionDelegate, request: uRLRequest)
    }//body
    
    init(uRLRequest:URLRequest,webViewStateModel: WebViewStateModel, onNavigationAction: ((_ navigationAction:WebView.NavigationAction) -> Void)?){
        self.uRLRequest = uRLRequest
        self.webViewStateModel = webViewStateModel
        self.actionDelegate = onNavigationAction
    }//init
    
    init(url:URL,webViewStateModel:WebViewStateModel,onNavigationAction:((_ navigationAction:WebView.NavigationAction) -> Void)? = nil){
        self.init(uRLRequest:URLRequest(url:url),
                  webViewStateModel:webViewStateModel,
                  onNavigationAction:onNavigationAction)
    }
    
    
}

//struct WebView_Previews: PreviewProvider {
//    static var previews: some View {
//        WebView()
//    }
//}
