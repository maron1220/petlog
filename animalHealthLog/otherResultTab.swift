//
//  otherResultTab.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/04/15.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct otherResultTab: View {
     @State private var otherSelection = 0
       
       var body: some View {
        VStack{
        Picker(selection: $otherSelection, label: Text("")){
            Text("CPK").tag(0)
        }//Pickerの閉じ
        .pickerStyle(SegmentedPickerStyle())
        
        if otherSelection == 0 {
            showCpkValue()
        } else {
            Text("")
            }
             }//VStackの閉じ
//           TabView(selection: $otherSelection){
//               showCpkValue()
//                   .tabItem{
//                       Text("CPK")
//               }
//           .tag(0)
//       }
       }
}

struct otherResultTab_Previews: PreviewProvider {
    static var previews: some View {
        otherResultTab()
    }
}
