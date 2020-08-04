
//  showBunValue.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/04/01.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI
import CoreData

struct showBunValue:View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(
       entity: BtList.entity(),
       sortDescriptors: [NSSortDescriptor(keyPath:\BtList.saveDate,ascending:false)],
       predicate: NSPredicate(format:"bun != %@","")
       )
       var notCompletedBunLists:FetchedResults<BtList>
       
    var dateFormatter:DateFormatter{
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("yMMMMd")

        return formatter
    }
    
    var body:some View {
        List{
            Section(header:Text("日付|結果|基準値|単位")){
            ForEach(notCompletedBunLists){list in
//              if list.bun as? String != nil{
                    HStack{
                        Text("\(list.saveDate ?? Date(),formatter: self.dateFormatter)").frame(width:UIScreen.screenWidth/5)
                        Divider()
                BunValueList(btList:list).frame(width: UIScreen.screenWidth/5)
                        ListSecondContainer(btUnitValue: BtListView().kidneyUnits["BUN"] ?? "error", btCriteriaValue: BtListView().kidneyBtCriteria["BUN"] ?? "error")
                    }//HStack
                
//              }//list

                }//ForeEach
                .onDelete{
                    indexSet in
                    for index in indexSet{
                        self.managedObjectContext.delete(self.notCompletedBunLists[index])
                    }//onDelete
                }
            }//Section
        }//List
    }
}

struct showBunValue_Previews: PreviewProvider {
    static var previews: some View {
        showBunValue()
    }
}
