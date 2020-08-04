//
//  proteinResultTab.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/04/15.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct proteinResultTab: View {
    @State private var proteinSelection = 0
    
    var body: some View {
        VStack{
        Picker(selection: $proteinSelection, label: Text("")){
            Text("TP").tag(0)
            Text("ALB").tag(1)
        }//Pickerの閉じ
        .pickerStyle(SegmentedPickerStyle())
        
        if proteinSelection == 0 {
            showTpValue()
        } else if proteinSelection == 1{
            showAlbValue()
        } else {
            Text("")
            }
             }//VStackの閉じ
//        TabView(selection: $proteinSelection){
//            showTpValue()
//                .tabItem{
//                    Text("TP")
//            }
//        .tag(0)
//
//             showAlbValue()
//                .tabItem{
//                    Text("ALB")
//            }
//        .tag(1)
//
//    }
//    }
}
}
struct proteinResultTab_Previews: PreviewProvider {
    static var previews: some View {
        proteinResultTab()
    }
}
