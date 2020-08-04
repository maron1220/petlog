//
//  showAltValue.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/04/04.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI
import CoreData

struct showAltValue: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(
    entity: BtList.entity(),
    sortDescriptors: [NSSortDescriptor(keyPath:\BtList.saveDate,ascending:false)],
    predicate: NSPredicate(format:"alt != %@","")
    )
    var notCompletedAltLists:FetchedResults<BtList>
    
    var dateFormatter:DateFormatter{
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("yMMMMd")

        return formatter
    }
    
    var body: some View {
                     List{
                         Section(header:Text("日付|結果|基準値|単位")){
                            ForEach(notCompletedAltLists){list in
//                             if list.alt as? String != nil{
                                 HStack{
                                    Text("\(list.saveDate ?? Date(),formatter: self.dateFormatter)").frame(width:UIScreen.screenWidth/5)
                                    Divider()
                                AltValueList(btList:list).frame(width: UIScreen.screenWidth/5)
                                    ListSecondContainer(btUnitValue: BtListView().liverUnits["ALT(GPT)"] ?? "error", btCriteriaValue: BtListView().liverBtCriteria["ALT(GPT)"] ?? "error")
                             }//HStack
//                             }//list
                            }//ForEach
                            .onDelete{
                            indexSet in
                            for index in indexSet{
                                self.managedObjectContext.delete(self.notCompletedAltLists[index])
                            }//onDelete
                            }
                        }
                 }
    }
}


struct showAltValue_Previews: PreviewProvider {
    static var previews: some View {
        showAltValue()
    }
}
