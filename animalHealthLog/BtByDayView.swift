//
//  BtByDayView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/06/27.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI



struct BtByDayView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(
        entity: BtList.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath:\BtList.saveDate,ascending:false)],
        predicate: NSPredicate(format:"isComplete == %@",NSNumber(value:false))
        
    )
    var DayBtList:FetchedResults<BtList>
    
    var dateFormatter:DateFormatter{
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("yMMMMdEEEE")
        
        return formatter
    }
    
    @Binding var dayBtDate:String
    
    @State var btDictionary:[String:[String]] = [
        "BUN":[],
        "CRE":[],
        "ALT(GPT)":[],
        "AST(GOT)":[],
        "ALP":[],
        "GGT":[],
        "T-Bil":[],
        "NH3":[],
        "TP":[],
        "ALB":[],
        "GLU":[],
        "Na":[],
        "K":[],
        "Cl":[],
        "Ca":[],
        "IP":[],
        "Mg":[],
        "Amy":[],
        "Lip":[],
        "TG":[],
        "Tcho":[],
        "CRP":[],
        "CK(CPK)":[]
    ]
    
    @State var showBtListButtonBool = true
    @State var btListBool = false
    
    
    
    var body: some View {
        
        VStack{
            if(self.showBtListButtonBool){
                Form{
                Button(action:{
                    for list in self.DayBtList{
                        if self.dateFormatter.string(from:list.saveDate ?? Date()) == self.dayBtDate{
                            print("date success")
                            if let bun = list.bun{
                                self.btDictionary["BUN"]?.append("\(bun)")
                            }else{
                                print("bun is Empty")
                            }
                            if let cre = list.cre{
                                self.btDictionary["CRE"]?.append("\(cre)")
                            }else{
                                print("cre is Empty")
                            }
                            if let alt = list.alt{
                                self.btDictionary["ALT(GPT)"]?.append("\(alt)")
                            }else{
                                print("alt is Empty")
                            }
                            if let ast = list.ast{
                                self.btDictionary["AST(GOT)"]?.append("\(ast)")
                            }else{
                                print("ast is Empty")
                            }
                            if let alp = list.alp{
                                self.btDictionary["ALP"]?.append("\(alp)")
                            }else{
                                print("alp is Empty")
                            }
                            if let ggt = list.ggt{
                                self.btDictionary["GGT"]?.append("\(ggt)")
                            }else{
                                print("ggt is Empty")
                            }
                            if let tbil = list.tbil{
                                self.btDictionary["T-Bil"]?.append("\(tbil)")
                            }else{
                                print("tbil is Empty")
                            }
                            if let nh = list.nh{
                                self.btDictionary["NH3"]?.append("\(nh)")
                            }else{
                                print("nh is Empty")
                            }
                            if let tp = list.tp{
                                self.btDictionary["TP"]?.append("\(tp)")
                            }else{
                                print("tp is Empty")
                            }
                            if let alb = list.alb{
                                self.btDictionary["ALB"]?.append("\(alb)")
                            }else{
                                print("alb is Empty")
                            }
                            if let glu = list.glu{
                                self.btDictionary["GLU"]?.append("\(glu)")
                            }else{
                                print("glu is Empty")
                            }
                            if let na = list.na{
                                self.btDictionary["Na"]?.append("\(na)")
                            }else{
                                print("na is Empty")
                            }
                            if let k = list.k{
                                self.btDictionary["K"]?.append("\(k)")
                            }else{
                                print("k is Empty")
                            }
                            if let cl = list.cl{
                                self.btDictionary["Cl"]?.append("\(cl)")
                            }else{
                                print("cl is Empty")
                            }
                            if let ca = list.ca{
                                self.btDictionary["Ca"]?.append("\(ca)")
                            }else{
                                print("ca is Empty")
                            }
                            if let ip = list.ip{
                                self.btDictionary["IP"]?.append("\(ip)")
                            }else{
                                print("ip is Empty")
                            }
                            if let mg = list.mg{
                                self.btDictionary["Mg"]?.append("\(mg)")
                            }else{
                                print("mg is Empty")
                            }
                            if let amy = list.amy{
                                self.btDictionary["Amy"]?.append("\(amy)")
                            }else{
                                print("amy is Empty")
                            }
                            if let lip = list.lip{
                                self.btDictionary["Lip"]?.append("\(lip)")
                            }else{
                                print("lip is Empty")
                            }
                            if let tg = list.tg{
                                self.btDictionary["TG"]?.append("\(tg)")
                            }else{
                                print("tg is Empty")
                            }
                            if let tcho = list.tcho{
                                self.btDictionary["Tcho"]?.append("\(tcho)")
                            }else{
                                print("tcho is Empty")
                            }
                            if let crp = list.crp{
                                self.btDictionary["CRP"]?.append("\(crp)")
                            }else{
                                print("crp is Empty")
                            }
                            if let cpk = list.cpk{
                                self.btDictionary["CK(CPK)"]?.append("\(cpk)")
                            }else{
                                print("cpk is Empty")
                            }
                            print(self.btDictionary)
                            
                            self.btListBool = true
                            self.showBtListButtonBool = false
                        }//if
                        else{
                            print("date error")
                        }
                    }//for in
                }){
                    HStack{
                    Text("血液検査を見る")
                    Spacer()
                    Image(systemName: "arrowtriangle.down.fill").font(.system(size: 16, weight: .ultraLight))
                    }
                }
            
                }//Form
                .cornerRadius(6)
            }//if
            
            if(self.btListBool){
                VStack{
//                    Divider()
                    Form{
                    Button(action:{
                        self.btListBool = false
                    }){
                        HStack{
                        Text("血液検査を閉じる")
                        Spacer()
                        Image(systemName: "arrowtriangle.up.fill").font(.system(size: 16, weight: .ultraLight))
                        }
                        }
//                    }//Form
//                    Form{
                        
                        Group{
                            
                            if self.btDictionary["BUN"]?.isEmpty ?? false{}
                            else{
                                BtDayListView(btDayListDictionary: self.btDictionary["BUN"] ?? ["error"], btDayListSection: "BUN", btDayListUnits: BtListView().kidneyUnits["BUN"] ?? "error")
                            }//else
                            
                            if self.btDictionary["CRE"]?.isEmpty ?? false{}
                            else{
                                BtDayListView(btDayListDictionary: self.btDictionary["CRE"] ?? ["error"], btDayListSection: "CRE", btDayListUnits: BtListView().kidneyUnits["CRE"] ?? "error")
                            }//else
                            
                            if self.btDictionary["ALT(GPT)"]?.isEmpty ?? false{}
                            else{
                                BtDayListView(btDayListDictionary: self.btDictionary["ALT(GPT)"] ?? ["error"], btDayListSection: "ALT(GPT)", btDayListUnits: BtListView().liverUnits["ALT(GPT)"] ?? "error")
                            }//else
                            
                            if self.btDictionary["AST(GOT)"]?.isEmpty ?? false{}
                            else{
                                BtDayListView(btDayListDictionary: self.btDictionary["AST(GOT)"] ?? ["error"], btDayListSection: "AST(GOT)", btDayListUnits: BtListView().liverUnits["AST(GOT)"] ?? "error")
                            }//else
                            
                            if self.btDictionary["ALP"]?.isEmpty ?? false{}
                            else{
                                BtDayListView(btDayListDictionary: self.btDictionary["ALP"] ?? ["error"], btDayListSection: "ALP", btDayListUnits: BtListView().liverUnits["ALP"] ?? "error")
                            }//else
                            
                            if self.btDictionary["GGT"]?.isEmpty ?? false{}
                            else{
                                BtDayListView(btDayListDictionary: self.btDictionary["GGT"] ?? ["error"], btDayListSection: "GGT", btDayListUnits: BtListView().liverUnits["GGT"] ?? "error")
                            }//else
                            
                            if self.btDictionary["T-Bil"]?.isEmpty ?? false{}
                            else{
                                BtDayListView(btDayListDictionary: self.btDictionary["T-Bil"] ?? ["error"], btDayListSection: "T-Bil", btDayListUnits: BtListView().liverUnits["T-Bil"] ?? "error")
                            }//else
                            
                            if self.btDictionary["NH3"]?.isEmpty ?? false{}
                            else{
                                BtDayListView(btDayListDictionary: self.btDictionary["NH3"] ?? ["error"], btDayListSection: "NH3", btDayListUnits: BtListView().liverUnits["NH3"] ?? "error")
                            }//else
                            
                            if self.btDictionary["TP"]?.isEmpty ?? false{}
                            else{
                                BtDayListView(btDayListDictionary: self.btDictionary["TP"] ?? ["error"], btDayListSection: "TP", btDayListUnits: BtListView().proteinUnits["TP"] ?? "error")
                            }//else
                            
                            if self.btDictionary["ALB"]?.isEmpty ?? false{}
                            else{
                                BtDayListView(btDayListDictionary: self.btDictionary["ALB"] ?? ["error"], btDayListSection: "ALB", btDayListUnits: BtListView().proteinUnits["ALB"] ?? "error")
                            }//else
                            
                        }//Group
                        Group{
                            if self.btDictionary["GLU"]?.isEmpty ?? false{}
                            else{
                                BtDayListView(btDayListDictionary: self.btDictionary["GLU"] ?? ["error"], btDayListSection: "GLU", btDayListUnits: BtListView().glucoseUnits["GLU"] ?? "error")
                            }//else
                            
                            if self.btDictionary["Na"]?.isEmpty ?? false{}
                            else{
                                BtDayListView(btDayListDictionary: self.btDictionary["Na"] ?? ["error"], btDayListSection: "Na", btDayListUnits: BtListView().mineralUnits["Na"] ?? "error")
                            }//else
                            
                            if self.btDictionary["K"]?.isEmpty ?? false{}
                            else{
                                BtDayListView(btDayListDictionary: self.btDictionary["K"] ?? ["error"], btDayListSection: "K", btDayListUnits: BtListView().mineralUnits["K"] ?? "error")
                            }//else
                            
                            if self.btDictionary["Cl"]?.isEmpty ?? false{}
                            else{
                                BtDayListView(btDayListDictionary: self.btDictionary["Cl"] ?? ["error"], btDayListSection: "Cl", btDayListUnits: BtListView().mineralUnits["Cl"] ?? "error")
                            }//else
                            
                            if self.btDictionary["Ca"]?.isEmpty ?? false{}
                            else{
                                BtDayListView(btDayListDictionary: self.btDictionary["Ca"] ?? ["error"], btDayListSection: "Ca", btDayListUnits: BtListView().mineralUnits["Ca"] ?? "error")
                            }//else
                            
                            if self.btDictionary["IP"]?.isEmpty ?? false{}
                            else{
                                BtDayListView(btDayListDictionary: self.btDictionary["IP"] ?? ["error"], btDayListSection: "IP", btDayListUnits: BtListView().mineralUnits["IP"] ?? "error")
                            }//else
                            
                            if self.btDictionary["Mg"]?.isEmpty ?? false{}
                            else{
                                BtDayListView(btDayListDictionary: self.btDictionary["Mg"] ?? ["error"], btDayListSection: "Mg", btDayListUnits: BtListView().mineralUnits["Mg"] ?? "error")
                            }//else
                            
                            if self.btDictionary["Amy"]?.isEmpty ?? false{}
                            else{
                                BtDayListView(btDayListDictionary: self.btDictionary["Amy"] ?? ["error"], btDayListSection: "Amy", btDayListUnits: BtListView().pancreaUnits["Amy"] ?? "error")
                            }//else
                            
                            if self.btDictionary["Lip"]?.isEmpty ?? false{}
                            else{
                                BtDayListView(btDayListDictionary: self.btDictionary["Lip"] ?? ["error"], btDayListSection: "Lip", btDayListUnits: BtListView().pancreaUnits["Lip"] ?? "error")
                            }//else
                            
                            if self.btDictionary["TG"]?.isEmpty ?? false{}
                            else{
                                BtDayListView(btDayListDictionary: self.btDictionary["TG"] ?? ["error"], btDayListSection: "TG", btDayListUnits: BtListView().lipidUnits["TG"] ?? "error")
                            }//else
                            
                        }//Group
                        
                        Group{
                            if self.btDictionary["Tcho"]?.isEmpty ?? false{}
                            else{
                                BtDayListView(btDayListDictionary: self.btDictionary["Tcho"] ?? ["error"], btDayListSection: "Tcho", btDayListUnits: BtListView().lipidUnits["Tcho"] ?? "error")
                            }//else
                            
                            if self.btDictionary["CRP"]?.isEmpty ?? false{}
                            else{
                                BtDayListView(btDayListDictionary: self.btDictionary["CRP"] ?? ["error"], btDayListSection: "CRP", btDayListUnits: BtListView().inflammationUnits["CRP"] ?? "error")
                            }//else
                            
                            if self.btDictionary["CK(CPK)"]?.isEmpty ?? false{}
                            else{
                                BtDayListView(btDayListDictionary: self.btDictionary["CK(CPK)"] ?? ["error"], btDayListSection: "CK(CPK)", btDayListUnits: BtListView().otherUnits["CK(CPK)"] ?? "error")
                            }//else
                        }//Group
                        
                    }//form
                    .cornerRadius(6)
                    
                    
                }//VStack
                
            }//if
            
            if(self.btListBool == false && self.showBtListButtonBool == false){
//                Divider()
                Form{
                Button(action:{
                    self.btListBool = true
                }){
                    HStack{
                    Text("血液検査を開く")
                    Spacer()
                    Image(systemName: "arrowtriangle.down.fill").font(.system(size: 16, weight: .ultraLight))
                    }
                }
//                Spacer()
            }
                .cornerRadius(6)
            }//Form
            
        }//VStack
    
    }
}

struct BtDayListView:View{

    @State var btDayListDictionary:[String]
    @State var btDayListSection:String
    @State var btDayListUnits:String
    var body:some View{

        Section(header:Text("\(self.btDayListSection)")){
            ForEach (self.btDayListDictionary,id:\.self){ dayListData in
                HStack{
                    Text("\(dayListData)")
                    Divider()
                    Text("\( self.btDayListUnits)")
                }//HStack

            }//ForEach
        }//Section


    }
}

struct BtByDayView_Previews: PreviewProvider {
    static var previews: some View {
        BtByDayView(dayBtDate: .constant(""))
    }
}
