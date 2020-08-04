//
//  showCrpValue.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/04/15.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct showCrpValue: View {
    
     @Environment(\.managedObjectContext) var managedObjectContext
      @FetchRequest(
      entity: BtList.entity(),
      sortDescriptors: [NSSortDescriptor(keyPath:\BtList.saveDate,ascending:false)],
      predicate: NSPredicate(format:"crp != %@","")
      )
      var notCompletedCrpLists:FetchedResults<BtList>
    
    var dateFormatter:DateFormatter{
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("yMMMMd")

        return formatter
    }
      
      var body: some View {
                       List{
                           Section(header:Text("日付|結果|基準値|単位")){
                              ForEach(notCompletedCrpLists){list in
//                               if list.crp as? String != nil{
                                   HStack{
                                    Text("\(list.saveDate ?? Date(),formatter: self.dateFormatter)").frame(width:UIScreen.screenWidth/5)
                                    Divider()
                                  CrpValueList(btList:list).frame(width: UIScreen.screenWidth/5)
                                      ListSecondContainer(btUnitValue: BtListView().inflammationUnits["CRP"] ?? "error", btCriteriaValue: BtListView().inflammationBtCriteria["CRP"] ?? "error")
                               }
//                               }
                              }
                            .onDelete{
                                indexSet in
                                for index in indexSet{
                                    self.managedObjectContext.delete(self.notCompletedCrpLists[index])
                                }//onDelete
                            }
                          }
                   }
      }
}

struct showCrpValue_Previews: PreviewProvider {
    static var previews: some View {
        showCrpValue()
    }
}
