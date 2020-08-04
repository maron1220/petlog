//
//  showMgValue.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/04/15.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct showMgValue: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(
    entity: BtList.entity(),
    sortDescriptors: [NSSortDescriptor(keyPath:\BtList.saveDate,ascending:false)],
    predicate: NSPredicate(format:"mg != %@","")
    )
    var notCompletedMgLists:FetchedResults<BtList>
    
    var dateFormatter:DateFormatter{
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("yMMMMd")

        return formatter
    }
    
    var body: some View {
                     List{
                         Section(header:Text("日付|結果|基準値|単位")){
                            ForEach(notCompletedMgLists){list in
//                             if list.mg as? String != nil{
                                 HStack{
                                    Text("\(list.saveDate ?? Date(),formatter: self.dateFormatter)").frame(width:UIScreen.screenWidth/5)
                                    Divider()
                                MgValueList(btList:list).frame(width: UIScreen.screenWidth/5)
                                    ListSecondContainer(btUnitValue: BtListView().mineralUnits["Mg"] ?? "error", btCriteriaValue: BtListView().mineralBtCriteria["Mg"] ?? "error")
                             }
//                             }
                            }
                            .onDelete{
                            indexSet in
                            for index in indexSet{
                                self.managedObjectContext.delete(self.notCompletedMgLists[index])
                            }//onDelete
                        }
                        }
                 }
    }
}

struct showMgValue_Previews: PreviewProvider {
    static var previews: some View {
        showMgValue()
    }
}
