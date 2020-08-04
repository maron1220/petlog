//
//  addExamObserver.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/04/05.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI
import CoreData



class AddExam:ObservableObject {
    
    @Environment(\.managedObjectContext) var context
    
    @State var bunValues:String = ""
    @State var creValue:String = ""
    @State var ipValue:String = ""
    @State var altValue:String = ""
    @State var livername:String = ""
    @State var mineralname:String = ""
    @State var pancreaname:String = ""
    
    func addBun(){
           let newBun = BtList(context:context)
           newBun.id = UUID()
           newBun.isComplete = false
           newBun.bun = bunValues
           newBun.saveDate = Date()
           
           do{
               try context.save()
           }catch{
               print(error)
           }
           
       }
       
       func addCre(){
           let newCre = BtList(context: context)
           newCre.id = UUID()
           newCre.isComplete = false
           newCre.cre = creValue
           newCre.saveDate = Date()
           
           do{
               try context.save()
           }catch{
               print(error)
           }
       }
       
       func addIp(){
           let newIp = BtList(context: context)
           newIp.id = UUID()
           newIp.isComplete = false
           newIp.ip = ipValue
           newIp.saveDate = Date()
           
           do{
               try context.save()
           }catch{
               print(error)
           }
       }
       
       func addAlt(){
           let newAlt = BtList(context: context)
           newAlt.id = UUID()
           newAlt.isComplete = false
           newAlt.alt = altValue
           newAlt.saveDate = Date()
           
           do{
               try context.save()
           }catch{
               print(error)
           }
       }
}
