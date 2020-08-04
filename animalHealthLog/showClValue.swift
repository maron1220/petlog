//
//  showClValue.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/04/15.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct showClValue: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
   @FetchRequest(
    entity: BtList.entity(),
    sortDescriptors: [NSSortDescriptor(keyPath:\BtList.saveDate,ascending:false)],
    predicate: NSPredicate(format:"cl != %@","")
    )
    var notCompletedClLists:FetchedResults<BtList>
    
    var dateFormatter:DateFormatter{
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("yMMMMd")

        return formatter
    }
    
    var body: some View {
                     List{
                         Section(header:Text("日付|結果|基準値|単位")){
                            ForEach(notCompletedClLists){list in
//                             if list.cl as? String != nil{
                                 HStack{
                                    Text("\(list.saveDate ?? Date(),formatter: self.dateFormatter)").frame(width:UIScreen.screenWidth/5)
                                    Divider()
                                ClValueList(btList:list).frame(width: UIScreen.screenWidth/5)
                                    ListSecondContainer(btUnitValue: BtListView().mineralUnits["Cl"] ?? "error", btCriteriaValue: BtListView().mineralBtCriteria["Cl"] ?? "error")
                             }
//                             }
                            }
                            .onDelete{
                                               indexSet in
                                               for index in indexSet{
                                                   self.managedObjectContext.delete(self.notCompletedClLists[index])
                                               }//onDelete
                                           }
                        }
                 }
    }
}

struct showClValue_Previews: PreviewProvider {
    static var previews: some View {
        showClValue()
    }
}
