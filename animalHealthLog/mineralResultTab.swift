//
//  mineralResultTab.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/04/15.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct mineralResultTab: View {
    @State private var mineralSelection = 0
    
    var body: some View {
        VStack{
        Picker(selection: $mineralSelection, label: Text("")){
            Text("Na").tag(0)
            Text("K").tag(1)
            Text("Cl").tag(2)
            Text("Ca").tag(3)
            Text("IP").tag(4)
            Text("Mg").tag(5)
        }//Pickerの閉じ
        .pickerStyle(SegmentedPickerStyle())
        
        if mineralSelection == 0 {
            showNaValue()
        } else if mineralSelection == 1{
            showKValue()
        }else if mineralSelection == 2{
            showClValue()
        }else if mineralSelection == 3{
            showCaValue()
        }else if mineralSelection == 4{
            showIpValue()
        }else if mineralSelection == 5{
            showMgValue()
        }
        else {
            Text("")
            }
             }//VStackの閉じ
//        TabView(selection: $mineralSelection){
//            showNaValue()
//                .tabItem{
//                    Text("Na")
//            }
//        .tag(0)
//
//             showKValue()
//                .tabItem{
//                    Text("K")
//            }
//        .tag(1)
//
//            showClValue()
//                .tabItem{
//                    Text("Cl")
//        }
//    .tag(2)
//            showCaValue()
//                        .tabItem{
//                            Text("Ca")
//                }
//            .tag(3)
//
//            showIpValue()
//                        .tabItem{
//                            Text("IP")
//                }
//            .tag(4)
//
//            showMgValue()
//                        .tabItem{
//                            Text("Mg")
//                }
//            .tag(5)
//    }
    }
}

struct mineralResultTab_Previews: PreviewProvider {
    static var previews: some View {
        mineralResultTab()
    }
}
