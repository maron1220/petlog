//
//  RegisterView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/04/07.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI
import CoreData

struct RegisterView: View {
    
    @Environment(\.managedObjectContext) var context
    
//    @FetchRequest(
//        entity: BtList.entity(),
//        sortDescriptors: [NSSortDescriptor(keyPath:\BtList.saveDate,ascending:false)],
//        predicate: NSPredicate(format:"isComplete == %@",NSNumber(value:false))
//        )
//        var notCompletedBtLists:FetchedResults<BtList>
//    
    
    func addAnimal(){
    let newAnimal = BtList(context: context)
    newAnimal.animalName = animalName
    newAnimal.isComplete = false
    newAnimal.animalAge = animalAge
    newAnimal.animalSpecie = animalSpecie
    
    do{
        try context.save()
    }catch{
        print(error)
    }
    }
    @State var animalName = ""
    @State var animalAge = ""
    @State var dogOrCat = ""
    @State var animalSpecie = ""
    var body: some View {
        VStack{
        Text("動物の情報を入力してください")
            HStack{
                Text("名前")
                TextField("",text: self.$animalName)
                Divider()
                Button(action:{
                    self.addAnimal()
                    UIApplication.shared.endEditing()
                               
                }){
                    Text("追加")
                }
            }
            HStack{
                Text("年齢")
                TextField("",text: self.$animalAge)
                Divider()
                Button(action:{
                    self.addAnimal()
                    UIApplication.shared.endEditing()
                               
                }){
                    Text("追加")
                }
            }
            HStack{
                Text("動物種")
                TextField("",text: self.$animalSpecie)
                Divider()
                Button(action:{
                    self.addAnimal()
                    UIApplication.shared.endEditing()
                               
                }){
                    Text("追加")
                }
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
