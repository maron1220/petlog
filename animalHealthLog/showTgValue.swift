//
//  showTgValue.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/04/15.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct showTgValue: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
    entity: BtList.entity(),
    sortDescriptors: [NSSortDescriptor(keyPath:\BtList.saveDate,ascending:false)],
    predicate: NSPredicate(format:"tg != %@","")
    )
    var notCompletedTgLists:FetchedResults<BtList>
    
    var dateFormatter:DateFormatter{
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("yMMMMd")

        return formatter
    }
    
    var body: some View {
                     List{
                         Section(header:Text("日付|結果|基準値|単位")){
                            ForEach(notCompletedTgLists){list in
//                             if list.tg as? String != nil{
                                 HStack{
                                    Text("\(list.saveDate ?? Date(),formatter: self.dateFormatter)").frame(width:UIScreen.screenWidth/5)
                                    Divider()
                                TgValueList(btList:list).frame(width: UIScreen.screenWidth/5)
                                    ListSecondContainer(btUnitValue: BtListView().lipidUnits["TG"] ?? "error", btCriteriaValue: BtListView().lipidBtCriteria["TG"] ?? "error")
                             }
//                             }
                            }
                            .onDelete{
                                indexSet in
                                for index in indexSet{
                                    self.managedObjectContext.delete(self.notCompletedTgLists[index])
                                }//onDelete
                            }
                        }
                 }
    }
}

struct showTgValue_Previews: PreviewProvider {
    static var previews: some View {
        showTgValue()
    }
}
