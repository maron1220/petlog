//
//  ExamInformationView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/04/15.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI
import WebKit

//class ViewController:UIViewController,WKUIDelegate{
//    
//    var webView:WKWebView!
//    
//    override func loadView() {
//        let webConfiguration = WKWebViewConfiguration()
//        webView = WKWebView(frame:.zero,configuration: webConfiguration)
//        webView.uiDelegate = self
//        view = webView
//    }
//    
////    override func viewDidLoad() {
////        
////            super.viewDidLoad()
////            
////            let myURL = URL(string: "https://senzyuchannel.com")
////            let myRequest = URLRequest(url: myURL!)
////            
////    }
//    
//    func GoBack(){
//        webView.goBack()
//    }
//}

//struct FirstWebView:UIViewRepresentable {
//    let myURL = URL(string: "https://senzyuchannel.com")
//    let myRequest = URLRequest(url: myURL!)
//}

struct ExamInformationView: View {
    
    @ObservedObject var webViewStateModel:WebViewStateModel = WebViewStateModel()
    
    var body: some View {
        
        VStack{
            HeaderView(headerColor: .gYellow, headerMenu: ".com")
         
        NavigationView{
           VStack{
                WebView(url:URL.init(string: "https://senzyuchannel.com")!,webViewStateModel: self.webViewStateModel)
            }//VStack
            .navigationBarTitle(Text(webViewStateModel.pageTitle),displayMode: .inline)
            .navigationBarItems(leading:
                Button(action:{
                    self.webViewStateModel.goBack.toggle()
                }){Image(systemName: "arrow.left.to.line.alt")
                    .imageScale(.large)
                   
                    
                }
                    .disabled(!webViewStateModel.canGoBack)
            )
        }//NavigationView
        }//VSTack
//        VStack{
//
////            ViewController().webView.load(URLRequest(url:URL(string: "https://senzyuchannel.com")!))
//      WebView(loadUrl: "https://senzyuchannel.com")
//
//        }//VStack
    }
}

struct ExamInformationView_Previews: PreviewProvider {
    static var previews: some View {
        ExamInformationView()
    }
}
