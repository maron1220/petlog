//
//  showCreValue.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/04/03.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI
import CoreData

struct showCreValue: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(
    entity: BtList.entity(),
    sortDescriptors: [NSSortDescriptor(keyPath:\BtList.saveDate,ascending:false)],
    predicate: NSPredicate(format:"cre != %@","")
    )
    var notCompletedCreLists:FetchedResults<BtList>
    
    var dateFormatter:DateFormatter{
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("yMMMMd")

        return formatter
    }
    
    var body: some View {
        List{
            Section(header:Text("日付|結果|基準値|単位")){
            ForEach(notCompletedCreLists){list in
//                if list.cre as? String != nil{  //値があるときだけリストに入れる
                    HStack{
                Text("\(list.saveDate ?? Date(),formatter: self.dateFormatter)").frame(width:UIScreen.screenWidth/5)
                Divider()
                CreValueList(btList:list).frame(width: UIScreen.screenWidth/5)
                    ListSecondContainer(btUnitValue: BtListView().kidneyUnits["CRE"] ?? "error", btCriteriaValue: BtListView().kidneyBtCriteria["CRE"] ?? "error")
                }
//                }
            }//ForEach
                .onDelete{
                indexSet in
                for index in indexSet{
                    self.managedObjectContext.delete(self.notCompletedCreLists[index])
                }//onDelete
        }
        }
    }
}
}

struct showCreValue_Previews: PreviewProvider {
    static var previews: some View {
        showCreValue()
    }
}

