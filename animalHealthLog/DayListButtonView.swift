//
//  DayListButtonView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/06/16.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI
import CoreData

extension Array{
    func unique() -> [Self.Element]{
        return NSOrderedSet(array: self).array as! [Self.Element]
    }
}//NSOrderSetを行ったあとのreturnをany型ではなく､配列もともとの型に直す

struct DayListButtonView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(
        entity: BtList.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath:\BtList.saveDate,ascending:false)],
        predicate: NSPredicate(format:"isComplete == %@",NSNumber(value:false))
        
    )
    var DayListButtons:FetchedResults<BtList>
    
    var dateFormatter:DateFormatter{
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("yMMMMdEEEE")
        
        return formatter
    }
    
    
    
    @State var doneDate = ""
    @State var resultDateArray = [""]
    @State var resultRegisterDate = ""
    @State var setResultRegisterDate = [""]
    
    @State var dayButtonBool = false
    @State var dayListBool = false
    
    var body: some View {
        
        VStack{
            if(dayButtonBool == false){
                ZStack{
                    Image("grey-icon")
                    .resizable()
                    .frame(width:UIScreen.main.bounds.width*6/10,height:UIScreen.main.bounds.width*6/10*4/3 )
                    .cornerRadius(6)
                    VStack{
                        Spacer()
                        Button(action:{
                            for list in self.DayListButtons{
                                self.resultRegisterDate = self.dateFormatter.string(from:list.saveDate ?? Date())
                                self.resultDateArray.append("\(self.resultRegisterDate)")
                                self.setResultRegisterDate = self.resultDateArray.unique()//NSOrderSetする(extension使う)
                                self.dayListBool = self.setResultRegisterDate.contains("\(self.resultRegisterDate)")
                                self.dayButtonBool = true
                                
                                print(self.setResultRegisterDate)
                                
                                
                                
                            }//for
                        }){
                            Text("日付別一覧を見る").foregroundColor(.gYellow).font(.largeTitle).bold()
                        }
                        Spacer()
                    }//VStack
                }//ZStack
            }//if
            else if(dayButtonBool){
                NavigationView{
                    List{
                        Section(header:Text("年|月|日|曜日")){
                            ForEach(self.setResultRegisterDate,id: \.self){daylist in
                                HStack{
                                    NavigationLink(destination: DayDetailSecondView(detailBtDate: self.$doneDate).environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)){
                                        Text("\(daylist)")
                                    }//NavigationLink
                                    //↓ボタンをNavigationLinkの外に出したらうまく行った
                                    Button(action:{
                                        self.doneDate = daylist
                                        //                                            .saveDate ?? Date()
                                    }){
                                        Text("")
                                    }//Button
                                }//HStack
                            }//ForEach
                        }//Section
                    }//List
                        .navigationBarTitle("日付別一覧",displayMode: .inline)
                }//NavigationView
                
            }//else if
            else{
                Text("error")
            }
            Spacer()
        }//VStack
        
    }
    
    struct DayListButtonView_Previews: PreviewProvider {
        static var previews: some View {
            DayListButtonView()
        }
    }
}
