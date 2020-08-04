//
//  showGluValue.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/04/15.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct showGluValue: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
     @FetchRequest(
          entity: BtList.entity(),
          sortDescriptors: [NSSortDescriptor(keyPath:\BtList.saveDate,ascending:false)],
          predicate: NSPredicate(format:"glu != %@","")
          )
          var notCompletedGluLists:FetchedResults<BtList>
    
    var dateFormatter:DateFormatter{
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("yMMMMd")

        return formatter
    }
          
          var body: some View {
                           List{
                               Section(header:Text("日付|結果|基準値|単位")){
                                  ForEach(notCompletedGluLists){list in
//                                   if list.glu as? String != nil{
                                       HStack{
                                        Text("\(list.saveDate ?? Date(),formatter: self.dateFormatter)").frame(width:UIScreen.screenWidth/5)
                                        Divider()
                                      GlucoseValueList(btList:list).frame(width: UIScreen.screenWidth/5)
                                          ListSecondContainer(btUnitValue: BtListView().glucoseUnits["Glu"] ?? "error", btCriteriaValue: BtListView().glucoseBtCriteria["Glu"] ?? "error")
                                   }
//                                   }
                                  }
                                .onDelete{
                                    indexSet in
                                    for index in indexSet{
                                        self.managedObjectContext.delete(self.notCompletedGluLists[index])
                                    }//onDelete
                                }
                              }
                       }
          }
}

struct showGluValue_Previews: PreviewProvider {
    static var previews: some View {
        showGluValue()
    }
}
