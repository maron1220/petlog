//
//  showNhValue.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/04/15.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct showNhValue: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(
    entity: BtList.entity(),
    sortDescriptors: [NSSortDescriptor(keyPath:\BtList.saveDate,ascending:false)],
    predicate: NSPredicate(format:"nh != %@","")
    )
    var notCompletedNhLists:FetchedResults<BtList>
    
    var dateFormatter:DateFormatter{
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("yMMMMd")

        return formatter
    }
    
    var body: some View {
                     List{
                         Section(header:Text("日付|結果|基準値|単位")){
                            ForEach(notCompletedNhLists){list in
//                             if list.nh as? String != nil{
                                 HStack{
                                    Text("\(list.saveDate ?? Date(),formatter: self.dateFormatter)").frame(width:UIScreen.screenWidth/5)
                                    Divider()
                                NhValueList(btList:list).frame(width: UIScreen.screenWidth/5)
                                    ListSecondContainer(btUnitValue: BtListView().liverUnits["NH3"] ?? "error", btCriteriaValue: BtListView().liverBtCriteria["NH3"] ?? "error")
                             }
//                             }
                            }
                            .onDelete{
                                indexSet in
                                for index in indexSet{
                                    self.managedObjectContext.delete(self.notCompletedNhLists[index])
                                }//onDelete
                            }
                        }
                 }
    }
}

struct showNhValue_Previews: PreviewProvider {
    static var previews: some View {
        showNhValue()
    }
}
