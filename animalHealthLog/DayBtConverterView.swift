//
//  DayBtConverterView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/06/09.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI
import CoreData

struct DayBtConverterView: View {
    @State private var dayBtSelection = 0
    
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = .gYellow
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor:UIColor.white],for:.selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor:UIColor.gYellow],for:.normal)
    }
    
     @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        
        VStack{
            HeaderView(headerColor: .gYellow, headerMenu: "検査結果")
        Picker(selection: $dayBtSelection, label: Text("")){
            Text("血液検査").tag(0)
            Text("画像").tag(1)
            Text("日付別").tag(2)
            Text("メモ").tag(3)
            
        }//Pickerの閉じ
        .pickerStyle(SegmentedPickerStyle())
            
            if dayBtSelection == 0{
                BtResultCollection()
            }else if dayBtSelection == 1{
                SavingImageView().environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
            }
            else if dayBtSelection == 2{
                DayListButtonView()
            }
//                DayListResultView()
            else if dayBtSelection == 3{
                MemoListView().environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
            }
            else{
                Text("error")
            }
    }//VStack
        
}
}

struct DayBtConverterView_Previews: PreviewProvider {
    static var previews: some View {
        DayBtConverterView()
    }
}
