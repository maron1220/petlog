//
//  pancreaResultTab.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/04/15.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct pancreaResultTab: View {
   @State private var pancreaSelection = 0
    
    var body: some View {
        VStack{
        Picker(selection: $pancreaSelection, label: Text("")){
            Text("Amy").tag(0)
            Text("Lip").tag(1)
        }//Pickerの閉じ
        .pickerStyle(SegmentedPickerStyle())
        
        if pancreaSelection == 0 {
            showAmyValue()
        } else if pancreaSelection == 1{
            showLipValue()
        } else {
            Text("")
            }
        }//VStackの閉じ
//        TabView(selection: $pancreaSelection){
//            showAmyValue()
//                .tabItem{
//                    Text("Amy")
//            }
//        .tag(0)
//            
//             showLipValue()
//                .tabItem{
//                    Text("Lip")
//            }
//        .tag(1)
//    }
    }
}

struct pancreaResultTab_Previews: PreviewProvider {
    static var previews: some View {
        pancreaResultTab()
    }
}
