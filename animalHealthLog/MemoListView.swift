//
//  MemoListView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/06/29.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct MemoListView: View {
    @FetchRequest(
        entity: BtList.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath:\BtList.saveDate,ascending:true),
        ],
        predicate: NSPredicate(format:"message != %@ " ,"")
    )
    var MemoList:FetchedResults<BtList>
    
    var dateFormatter:DateFormatter{
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("yMMMMdEEEE")
        
        return formatter
    }
    
    var body: some View {
        Form{
            ForEach(MemoList){memolist in
                
                    Text("[\(self.dateFormatter.string(from: memolist.saveDate ?? Date()))]")
                        .background(Color.greyBack)
                Text("\(memolist.message ?? "error")")
              
            }//ForEach
        }//List
    }
}

struct MemoListView_Previews: PreviewProvider {
    static var previews: some View {
        MemoListView()
    }
}
