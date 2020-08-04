//
//  ExamChoiceView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/06/10.
//  Copyright © 2020 Seiya. All rights reserved.
//

//import SwiftUI
//
//struct ExamChoiceView: View {
//    @State private var examSelection = 0
//    
//    init(){
//        UISegmentedControl.appearance().selectedSegmentTintColor = .gBlue
//        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor:UIColor.white],for:.selected)
//        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor:UIColor.gBlue],for:.normal)
//    }
//    
//    var body: some View {
//        VStack{
//            Picker(selection: $examSelection, label: Text("")){
//            Text("血液検査").tag(0)
//            Text("画像").tag(1)
//        }//Picker
//            .pickerStyle(SegmentedPickerStyle())
//        
//        if examSelection == 0 {
//            BtListView().environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
//        } else if examSelection == 1{
//            senderPhotoDataView().environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
//        } else {
//            Text("")
//            }
//            Spacer()//Tabを上に寄せる
//        
//    }//VStack
//}//body
//}//view
//
//struct ExamChoiceView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExamChoiceView()
//    }
//}
