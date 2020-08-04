//
//  MemoByDayView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/06/25.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct MemoByDayView: View {
    
    @FetchRequest(
        entity: BtList.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath:\BtList.saveDate,ascending:true),
        ],
        predicate: NSPredicate(format:"message != %@ " ,"")
    )
    var DayDetailMessage:FetchedResults<BtList>
    
    var dateFormatter:DateFormatter{
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("yMMMMdEEEE")
        
        return formatter
    }
    
    @Binding var doneMemoDate:String
    
    @State var memoListBool = false
    
    @State var showMemoListButtonBool = true
    
    var body: some View {
        VStack{
            if(self.showMemoListButtonBool){
                Form{
                    Button(action:{
                        self.memoListBool = true
                        self.showMemoListButtonBool = false
                    }){
                        HStack{
                            Text("メモを見る")
                            Spacer()
                            Image(systemName: "arrowtriangle.down.fill").font(.system(size: 16, weight: .ultraLight))
                        }
                    }
                }//Form
                    .cornerRadius(6)
            }//VStack
            VStack{
                if(self.memoListBool){
                    Form{
                        Button(action:{
                            self.memoListBool = false
                        }){
                            HStack{
                            Text("メモを閉じる")
                            Spacer()
                            Image(systemName: "arrowtriangle.up.fill").font(.system(size: 16, weight: .ultraLight))
                            }
                        }//Button
                        //        Section(header:Text("メモ")){
                        ForEach(DayDetailMessage){detailmessage in
                            
                            if(self.dateFormatter.string(from: detailmessage.saveDate ?? Date()) == self.doneMemoDate){
                                Text("\(detailmessage.message ?? "error")")
                                //                    }//section
                            }//List
                            
                        }//if
                    }//foreach
                        .cornerRadius(6)
                }//if
            }//VStack
            
            if(self.memoListBool == false && self.showMemoListButtonBool == false){
                Form{
                    Button(action:{
                        self.memoListBool = true
                    }){
                        HStack{
                            Text("メモを開く")
                            Spacer()
                            Image(systemName: "arrowtriangle.down.fill").font(.system(size: 16, weight: .ultraLight))
                        }
                    }
                }//Form
                    .cornerRadius(6)
            }
            
        }//VStack
    }//body
}

//struct MemoByDayView_Previews: PreviewProvider {
//
//
//
//    static var previews: some View {
//        MemoByDayView(, doneBtDate: )
//    }
//}
