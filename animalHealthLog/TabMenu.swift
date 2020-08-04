//
//  TabMenu.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/04/15.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI
import CoreData

struct TabMenu: View {
    
   
    
    @State var tabNum = 0
    var body: some View {
       TabView(selection: $tabNum){
                ExamInformationView()
                    .tabItem{
                        Text("HOME")
                }
            .tag(0)
                
                
                BtListView()
                    .tabItem{
                        Text("+")
            }
        .tag(1)
        
        BtResultCollection()
                           .tabItem{
                               Text("結果を見る")
                       }
                   .tag(2)
                   
        
        InformationView()
                    .tabItem{
                        Text("お知らせ")
            }
        .tag(3)
        
//        MyPageView()
//                    .tabItem{
//                        Text("マイページ")
//            }
//        .tag(4)
        }
        }
    }


struct TabMenu_Previews: PreviewProvider {
    static var previews: some View {
        TabMenu()
    }
}
