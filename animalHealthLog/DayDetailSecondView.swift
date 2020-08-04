//
//  DayDetailSecondView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/06/24.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI
import CoreData


struct DayDetailSecondView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(
        entity: BtList.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath:\BtList.saveDate,ascending:false)],
        predicate: NSPredicate(format:"message != %@","")
        
    )
    var messageList:FetchedResults<BtList>
    
    var dateFormatter:DateFormatter{
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("yMMMMdEEEE")
        
        return formatter
    }
    
    @Binding var detailBtDate:String
    
    @State var donemessage = ""
    
    @State var memoBool = false
    @State var btBool = false
    
    var body: some View {
        
        VStack{
            
            Text("\(self.detailBtDate)").foregroundColor(.gGrey).bold()
          
           
            HStack{
                Spacer()
             MemoByDayView(doneMemoDate: self.$detailBtDate)
                Divider()
             BtByDayView(dayBtDate: self.$detailBtDate)
                Spacer()
            }
            
            VStack{
                    Text("画像一覧").foregroundColor(.gGrey)
            PhotoByDayView(donePhotoDate: self.$detailBtDate)
            }
            .frame(height: UIScreen.main.bounds.height/3)
            
        }
        
    }//body
}



struct DayDetailSecondView_Previews: PreviewProvider {
    static var previews: some View {
        DayDetailSecondView(detailBtDate: .constant(""))
    }
}
