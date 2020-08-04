////
////  DayDetailHubView.swift
////  animalHealthLog
////
////  Created by 細川聖矢 on 2020/06/26.
////  Copyright © 2020 Seiya. All rights reserved.
////
//
//import SwiftUI
//
//struct DayDetailHubView: View {
//    
//    @Binding var doneDate:String
//    
//    var body: some View {
//        NavigationView{
//        HStack{
//            NavigationLink(destination:MemoByDayView( doneMemoDate:self.$doneDate)){
//            Text("メモ")
//            }
//            Text("画像")
//            Text("血液検査")
//        }
//        }
//    }
//}
//
//struct DayDetailHubView_Previews: PreviewProvider {
//    
//    @State var sampleDate = "sample"
//    
//    static var previews: some View {
//        DayDetailHubView(doneDate: .constant("sample"))
//    }
//}
