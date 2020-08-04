//
//  showAmyValue.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/04/15.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct showAmyValue: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
   @FetchRequest(
   entity: BtList.entity(),
   sortDescriptors: [NSSortDescriptor(keyPath:\BtList.saveDate,ascending:false)],
   predicate: NSPredicate(format:"amy != %@", "")
   )
   var notCompletedAmyLists:FetchedResults<BtList>
    
    var dateFormatter:DateFormatter{
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("yMMMMd")

        return formatter
    }
   
   var body: some View {
                    List{
                        Section(header:Text("日付|結果|基準値|単位")){
                           ForEach(notCompletedAmyLists){list in
//                            if list.amy as? String != nil{
                                HStack{
                                    Text("\(list.saveDate ?? Date(),formatter: self.dateFormatter)").frame(width:UIScreen.screenWidth/5)
                                    Divider()
                               AmyValueList(btList:list).frame(width: UIScreen.screenWidth/5)
                                   ListSecondContainer(btUnitValue: BtListView().pancreaUnits["Amy"] ?? "error", btCriteriaValue: BtListView().pancreaBtCriteria["Amy"] ?? "error")
                            }
//                            }
                           }
                            .onDelete{
                            indexSet in
                            for index in indexSet{
                                self.managedObjectContext.delete(self.notCompletedAmyLists[index])
                            }//onDelete
                       }
                }
    }
   }
}

struct showAmyValue_Previews: PreviewProvider {
    static var previews: some View {
        showAmyValue()
    }
}
