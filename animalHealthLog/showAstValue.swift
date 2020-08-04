//
//  showAstValue.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/06/09.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct showAstValue: View {
    @Environment(\.managedObjectContext) var managedObjectContext
       
       @FetchRequest(
       entity: BtList.entity(),
       sortDescriptors: [NSSortDescriptor(keyPath:\BtList.saveDate,ascending:false)],
       predicate: NSPredicate(format:"ast != %@","")
       )
       var notCompletedAstLists:FetchedResults<BtList>
       
       var dateFormatter:DateFormatter{
           let formatter = DateFormatter()
           formatter.setLocalizedDateFormatFromTemplate("yMMMMd")

           return formatter
       }
       
       var body: some View {
                        List{
                            Section(header:Text("日付|結果|基準値|単位")){
                               ForEach(notCompletedAstLists){list in
//                                if list.ast as? String != nil{
                                    HStack{
                                       Text("\(list.saveDate ?? Date(),formatter: self.dateFormatter)").frame(width:UIScreen.screenWidth/5)
                                       Divider()
                                   AstValueList(btList:list).frame(width: UIScreen.screenWidth/5)
                                       ListSecondContainer(btUnitValue: BtListView().liverUnits["AST(GOT)"] ?? "error", btCriteriaValue: BtListView().liverBtCriteria["AST(GOT)"] ?? "error")
                                }//HStack
//                                }//list
                               }//ForEach
                               .onDelete{
                               indexSet in
                               for index in indexSet{
                                   self.managedObjectContext.delete(self.notCompletedAstLists[index])
                               }//onDelete
                               }
                           }
                    }
       }
}

struct showAstValue_Previews: PreviewProvider {
    static var previews: some View {
        showAstValue()
    }
}
