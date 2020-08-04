//
//  showAlbValue.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/04/15.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct showAlbValue: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
     @FetchRequest(
       entity: BtList.entity(),
       sortDescriptors: [NSSortDescriptor(keyPath:\BtList.saveDate,ascending:false)],
       predicate: NSPredicate(format:"alb != %@","")
       )
       var notCompletedAlbLists:FetchedResults<BtList>
    
    var dateFormatter:DateFormatter{
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("yMMMMd")

        return formatter
    }
       
       var body: some View {
                        List{
                            Section(header:Text("日付|結果|基準値|単位")){
                               ForEach(notCompletedAlbLists){list in
//                                if list.alb as? String != nil{
                                    HStack{
                                        Text("\(list.saveDate ?? Date(),formatter: self.dateFormatter)").frame(width:UIScreen.screenWidth/5)
                                        Divider()
                                   AlbValueList(btList:list).frame(width: UIScreen.screenWidth/5)
                                       ListSecondContainer(btUnitValue: BtListView().proteinUnits["ALB"] ?? "error", btCriteriaValue: BtListView().proteinBtCriteria["ALB"] ?? "error")
                                }
//                                }
                               }
                                .onDelete{
                                    indexSet in
                                    for index in indexSet{
                                        self.managedObjectContext.delete(self.notCompletedAlbLists[index])
                                    }//onDelete
                                }
                           }
                    }
       }
}

struct showAlbValue_Previews: PreviewProvider {
    static var previews: some View {
        showAlbValue()
    }
}
