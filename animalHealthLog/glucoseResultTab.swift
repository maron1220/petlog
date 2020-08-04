//
//  glucoseResultTab.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/04/15.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct glucoseResultTab: View {
     @State private var glucoseSelection = 0
       
       var body: some View {
        VStack{
               Picker(selection: $glucoseSelection, label: Text("")){
                   Text("GLU").tag(0)
               }//Pickerの閉じ
               .pickerStyle(SegmentedPickerStyle())
               
               if glucoseSelection == 0 {
                   showGluValue()
               } else {
                   Text("")
                   }
                    }//VStackの閉じ
//           TabView(selection: $glucoseSelection){
//               showGluValue()
//                   .tabItem{
//                       Text("Glu")
//               }
//           .tag(0)
//               
//       }
       }
}

struct glucoseResultTab_Previews: PreviewProvider {
    static var previews: some View {
        glucoseResultTab()
    }
}
