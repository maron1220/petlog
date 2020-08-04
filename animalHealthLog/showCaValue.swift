//
//  showCaValue.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/04/15.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct showCaValue: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(
    entity: BtList.entity(),
    sortDescriptors: [NSSortDescriptor(keyPath:\BtList.saveDate,ascending:false)],
    predicate: NSPredicate(format:"ca != %@","")
    )
    var notCompletedCaLists:FetchedResults<BtList>
    
    var dateFormatter:DateFormatter{
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("yMMMMd")

        return formatter
    }
    
    var body: some View {
                     List{
                         Section(header:Text("日付|結果|基準値|単位")){
                            ForEach(notCompletedCaLists){list in
//                             if list.ca as? String != nil{
                                 HStack{
                                    Text("\(list.saveDate ?? Date(),formatter: self.dateFormatter)").frame(width:UIScreen.screenWidth/5)
                                    Divider()
                                CaValueList(btList:list).frame(width: UIScreen.screenWidth/5)
                                    ListSecondContainer(btUnitValue: BtListView().mineralUnits["Ca"] ?? "error", btCriteriaValue: BtListView().mineralBtCriteria["Ca"] ?? "error")
                             }
//                             }
                            }
                            .onDelete{
                                indexSet in
                                for index in indexSet{
                                    self.managedObjectContext.delete(self.notCompletedCaLists[index])
                                }//onDelete
                            }
                        }
                 }
    }
}

struct showCaValue_Previews: PreviewProvider {
    static var previews: some View {
        showCaValue()
    }
}
