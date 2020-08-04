//
//  lipidResultTab.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/04/15.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct lipidResultTab: View {
    @State private var lipidSelection = 0
    
    var body: some View {
         VStack{
               Picker(selection: $lipidSelection, label: Text("")){
                   Text("TG").tag(0)
                   Text("Tcho").tag(1)
               }//Pickerの閉じ
               .pickerStyle(SegmentedPickerStyle())
               
               if lipidSelection == 0 {
                   showTgValue()
               } else if lipidSelection == 1{
                   showTchoValue()
               } else {
                   Text("")
                   }
               }//VStackの閉じ
    }
}

struct lipidResultTab_Previews: PreviewProvider {
    static var previews: some View {
        lipidResultTab()
    }
}
