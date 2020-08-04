//
//  ContentView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/03/21.
//  Copyright © 2020 Seiya. All rights reserved.
//

//import SwiftUI
//import  CoreData
//
//let lightGreyColor = Color(red:239.0/255.0,green:243.0/255.0,blue:244.0/255.0,opacity: 1.0)
//let storedUsername = ""
//let storedPassword = ""
//
//struct appName:View{
//    var body:some View{
//        Text("アプリ名")
//        .font(.largeTitle)
//        .fontWeight(.semibold)
//        .padding(.bottom,20)
//    }
//}
//
//struct loginButtonContent:View{
//    var body:some View{
//        VStack{
//            Text("ログイン")
//            .font(.headline)
//            .foregroundColor(.white)
//            .padding()
//            .frame(width:250,height:60)
//            .background(Color.blue)
//            .cornerRadius(15.0)
//        }//VStack
//    }
//}
//
//struct userNameTextField:View {
//    @Binding var username:String
//    var body : some View{
//    return TextField("名前",text:$username)
//        .padding()
//        .background(lightGreyColor)
//        .cornerRadius(5.0)
//        .padding(.bottom,20)
//    }
//}
//
//struct passwordSecureField:View {
//    @Binding var password:String
//    var body :some View{
//        SecureField("パスワード",text: $password)
//        .padding()
//        .background(lightGreyColor)
//        .cornerRadius(5.0)
//        .padding(.bottom,20)
//    }
//}
//
////class BarHidden:ObservableObject{
////    @Published var BarBool:Bool = true
////
////    func BarAppear(){
////        self.BarBool = false
////    }
////}
//
//struct ContentView: View {
//    
////    @Environment var barHidden:BarHidden
//   
//    @ObservedObject var barHide = BarHiddenView()
//   
//    @State private var isPresented = false
//    @State var username:String = ""
//    @State var password:String = ""
//    
//    @State var authenticationDidFail:Bool = false
//    @State var authenticationDidSucceed:Bool = false
//    
//    @ObservedObject var keyboard = KeyboardObserver()
//    
//    @State var isTabMenu = false
//    
//    var body: some View {
//       
//        NavigationView{
//        ZStack{
//            VStack{
//                if isTabMenu{
//                    TabMenu()
//                }//if
//                else{
//                appName()
//                Text("｢アプリ名｣はペットの健康を記録し､管理する情報アプリです｡")
//                userNameTextField(username: $username)
//                passwordSecureField(password: $password)
//                }//else
//                
////                if authenticationDidFail{
////                    Text("入力情報が間違っています")
////                        .offset(y:-10)
////                        .foregroundColor(.red)
////                }//if
////                if authenticationDidSucceed{
////                    NavigationLink(destination:SelectTabMenu()){
////                    Text("アプリを使う")
////                        .font(.headline)
////                        .frame(width:250,height: 80)
////                        .background(Color.green)
////                        .cornerRadius(20.0)
////                        .foregroundColor(.white)
////                        .animation(Animation.default)
////                    }//NavigationLink
////                    .navigationBarTitle("")
////
////                }//if
//                
//                Button(action:{
//                    self.isPresented = true
//                    if self.username == storedUsername && self.password == storedPassword{
//                        self.authenticationDidSucceed = true
//                        self.authenticationDidFail = false
//                    }else{
//                        self.authenticationDidFail = true
//                    }
//                    UIApplication.shared.endEditing()
//                }){
//                loginButtonContent()
//                }//Button
//                .onAppear{
//                    self.keyboard.startObserve()
//                }.onDisappear{
//                    self.keyboard.stopObserve()
//                }.padding(.bottom,keyboard.keyboardHeight)
//                    .animation(.easeOut)
//                   
//                NavigationLink(destination:SelectTabMenu()){
//                    VStack{
//                    Text("利用規約に同意して新規登録")
//                    Text("ログイン")
//                    }
//                }
//                Text("ログインボタンを押すと利用規約に同意したものとみなします")
//                
//                
//            }//VStack
//            .padding()
//        }//ZStack
////            .navigationBarTitle("")
//            .navigationBarHidden(self.barHide.barHidden)
//       }//NavigationViewの閉じ
//       
//    }//bodyの閉じ
//    }
//
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
