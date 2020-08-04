//
//  kidneyResultTab.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/04/15.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct kidneyResultTab: View {
     @State private var kidneySelection = 0
       
       var body: some View {
        VStack{
        Picker(selection: $kidneySelection, label: Text("")){
            Text("BUN").tag(0)
            Text("CRE").tag(1)
        }//Pickerの閉じ
        .pickerStyle(SegmentedPickerStyle())
        
        if kidneySelection == 0 {
            showBunValue()
        } else if kidneySelection == 1{
            showCreValue()
        } else {
            Text("")
            }
             }//VStackの閉じ
//           TabView(selection: $kidneySelection){
//               showBunValue()
//                   .tabItem{
//                       Text("BUN")
//               }
//           .tag(0)
//
//                showCreValue()
//                   .tabItem{
//                       Text("CRE")
//               }
//           .tag(1)
//       }
       
       }//bodyの閉じ
}

struct kidneyResultTab_Previews: PreviewProvider {
    static var previews: some View {
        kidneyResultTab()
    }
}
