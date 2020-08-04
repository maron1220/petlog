//
//  SelectTabMenu.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/04/21.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentView = "home"
}

struct SubTabImage:View{
    @State public var subTabIcon = ""
    @State public var subTabName = ""
    var body: some View{
        VStack{
            Image(systemName: "\(subTabIcon)")
            .resizable()
                .aspectRatio(contentMode: .fit)
            .padding(5)
            Text("\(subTabName)")
                .font(.caption)
        }//VStack
    }
}

struct MainTabImage:View{
    var body:some View{
        ZStack{
//            Circle()
//                .foregroundColor(Color.white)
//                .frame(width:70,height: 70)
            Image(systemName: "plus.circle.fill")
            .resizable()
                .aspectRatio(contentMode: .fit)
            .padding(5)
//                .frame(width:70,height: 70)
//                .foregroundColor(.yellowTitle)
        }//ZStack
    }
}

//struct CurrentShownView:View{
//    @ObservedObject var viewRouter = ViewRouter()
//    var body:some View{
//        VStack{
//        if self.viewRouter.currentView == "home"{
//            ExamInformationView()
//        }
//        else if self.viewRouter.currentView == "result"{
//            BtResultCollection()
//            }
//        else if self.viewRouter.currentView == "add"{
//            BtListView()
//            }
//        else if self.viewRouter.currentView == "info"{
//            InformationView()
//            }
//        else if self.viewRouter.currentView == "myPage"{
//            MyPageView()
//            }
//        else{
//            Text("error")
//            }//else
//    }//VStack
//    }//body
//}

struct SelectTabMenu: View {
    
    
    
    @ObservedObject var viewRouter = ViewRouter()
//    @Environment var barAppear:BarHidden
    
    var body: some View {
        GeometryReader{geometry in //Geometryでviewのサイズを図る
        VStack{
        Spacer()
        VStack{
            if self.viewRouter.currentView == "home"{
                
                PetConditionRegisterView()
                .environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
            }
            else if self.viewRouter.currentView == "result"{
//                BtResultCollection()
                DayBtConverterView()
                .environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
                }
//            else if self.viewRouter.currentView == "add"{
////                BtListView()
//                VStack{
////                ExamChoiceView()
////                .environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
//              Text("empty")
//                }
//                }
            else if self.viewRouter.currentView == "info"{
                
//                ExamInformationView()
                TweetView()
                

               
            }
            else if self.viewRouter.currentView == "myPage"{
                LoginView()
                }
            else{
                Text("error")
                }//else
        }//VStack
//        Spacer()
        HStack{
            SubTabImage(subTabIcon: "house", subTabName: "home")
                .frame(width:geometry.size.width/6,height: 55)
                .foregroundColor(self.viewRouter.currentView == "home" ? .gYellow : .gray)
                .onTapGesture {
                    self.viewRouter.currentView = "home"
            }
            
//            SubTabImage(subTabIcon: "plus.circle", subTabName: "記録")
//                           .frame(width:geometry.size.width/6,height: 55)
//                           .foregroundColor(self.viewRouter.currentView == "add" ? .gBlue : .gray)
//                           .onTapGesture {
//                               self.viewRouter.currentView = "add"
//                       }
            
            SubTabImage(subTabIcon: "book",subTabName: "検査結果")
            .frame(width:geometry.size.width/6,height: 55)
            .foregroundColor(self.viewRouter.currentView == "result" ? .gYellow : .gray)
            .onTapGesture {
                

                    self.viewRouter.currentView = "result"
//                                self.barHide.barHidden = false
            }
            
           
            
            SubTabImage(subTabIcon: "bell",subTabName: ".com")
            .frame(width:geometry.size.width/6,height: 55)
            .foregroundColor(self.viewRouter.currentView == "info" ? .gYellow : .gray)
            .onTapGesture {
                    self.viewRouter.currentView = "info"
            }
            
            SubTabImage(subTabIcon: "person.circle",subTabName: "MyPage")
            .frame(width:geometry.size.width/6,height: 55)
            .foregroundColor(self.viewRouter.currentView == "myPage" ? .gYellow : .gray)
            .onTapGesture {
                    self.viewRouter.currentView = "myPage"
            }
            
        }//HStack
            .frame(width:geometry.size.width,height: geometry.size.height/12)
            .background(Color.white.shadow(radius:2))
            Spacer()
    }//VStack
//            .edgesIgnoringSafeArea(.bottom)
    }//View
    }//Geometry
}

//struct SelectTabMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectTabMenu()
//    }
//}

//struct SelectTabMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
//    }
//}
