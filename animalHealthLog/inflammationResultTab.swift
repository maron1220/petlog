//
//  inflammationResultTab.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/04/15.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct inflammationResultTab: View {
    @State private var inflammationSelection = 0
    
    var body: some View {
        VStack{
        Picker(selection: $inflammationSelection, label: Text("")){
            Text("CRP").tag(0)
        }//Pickerの閉じ
        .pickerStyle(SegmentedPickerStyle())
        
        if inflammationSelection == 0 {
            showCrpValue()
        } else {
            Text("")
            }
             }//VStackの閉じ
//        TabView(selection: $inflammationSelection){
//            showCrpValue()
//                .tabItem{
//                    Text("CRP")
//            }
//        .tag(0)
//    }
    }

}

struct inflammationResultTab_Previews: PreviewProvider {
    static var previews: some View {
        inflammationResultTab()
    }
}
