////
////  DayDetailView.swift
////  animalHealthLog
////
////  Created by 細川聖矢 on 2020/06/09.
////  Copyright © 2020 Seiya. All rights reserved.
////
//
//import SwiftUI
//import CoreData
//
//
//struct BtNameView:View {
//    
//    @State var nameOfBt:String
//    
//    var body: some View{
//        HStack{
//            Text("\(nameOfBt)").frame(width: UIScreen.screenWidth/5)
//            Divider()
//        }
//    }
//}
//
//
//struct DayDetailView: View {
//    
////    @FetchRequest(
////        entity: BtList.entity(),
////        sortDescriptors: [NSSortDescriptor(keyPath:\BtList.saveDate,ascending:true),
////        ],
////        predicate: NSPredicate(format:"isComplete == %@ " ,NSNumber(value:false))
////    )
////    var DayDetailLists:FetchedResults<BtList>
//    
//    @Binding var doneBtDate:String
//    
//    var dateFormatter:DateFormatter{
//        let formatter = DateFormatter()
//        formatter.setLocalizedDateFormatFromTemplate("yMMMMdEEEE")
//        
//        return formatter
//    }
//    
//    var saveDateFormatter:DateFormatter{
//        let saveFormatter = DateFormatter()
//        saveFormatter.setLocalizedDateFormatFromTemplate("yMMMMd")
//        
//        return saveFormatter
//    }
//    
//    @State var btDictionary:[String:[String]] = [
//        "BUN":[],
//        "CRE":[],
//        "ALT(GPT)":[],
//        "AST(GOT)":[],
//        "ALP":[],
//        "GGT":[],
//        "T-Bil":[],
//        "NH3":[],
//        "TP":[],
//        "ALB":[],
//        "GLU":[],
//        "Na":[],
//        "K":[],
//        "Cl":[],
//        "Ca":[],
//        "IP":[],
//        "Mg":[],
//        "Amy":[],
//        "Lip":[],
//        "TG":[],
//        "Tcho":[],
//        "CRP":[],
//        "CK(CPK)":[]
//    ]
//    
//    
//    @State var btListBool = false
//    @State var showBtListButtonBool = true
//    
//    @State var photoImage:Data = UIImage(imageLiteralResourceName: "grey-icon").pngData()!
//    @State var photoTitle:String = ""
//    
//    var imageWidth = UIScreen.main.bounds.width*4/10
//    var imageheight = UIScreen.main.bounds.width*4/10*4/3
//    
//    @State var zoomAppear = false
//    
//    
//    var body: some View {
//        
//       VStack{
//            padding()
//
//            Text("\(self.doneBtDate)").font(.caption).foregroundColor(.gGreen)
//            Divider()
////            Text("画像一覧").font(.title)
//
////        ForEach(DayDetailLists){photolist in
////              VStack{
////            ScrollView(.horizontal,showsIndicators: false){
////                HStack{
////
////                        if (self.dateFormatter.string(from:photolist.saveDate ?? Date()) == self.doneBtDate && photolist.imageData != nil){
////
////                            ZStack{
////
////                                Image(uiImage:UIImage(data:photolist.imageData ?? self.photoImage)!)
////                                    .resizable()
////                                    .frame(width:self.imageWidth,height:self.imageheight )
////                                    .cornerRadius(6)
////                                    .onTapGesture {
////                                        self.photoImage = photolist.imageData ?? self.photoImage
////                                        self.photoTitle = photolist.phototitle ?? ""
////                                        self.zoomAppear.toggle()
////
////                                }
////                                .sheet(isPresented: self.$zoomAppear){ PhotoZoomView(zoomPhotoImage:self.$photoImage,zoomPhotoTitle: self.$photoTitle)
////                                }
////
////                                    Text("\(photolist.phototitle ?? "")").foregroundColor(.white)
////
////                            }//ZStack
////
////                        }//if
////                    }//HStack
////                }//ScrollView
//                NavigationView{
//                    NavigationLink(destination:MemoByDayView( doneMemoDate: self.$doneBtDate)){
//                        Text("メモを見る")
//                    }
//                }
//                
////            }//VStack
////                
//
////            }//ForeEach
//            
////            if(self.btListBool == false && self.showBtListButtonBool == false){
////                           Divider()
////                           Button(action:{
////                               self.btListBool = true
////                           }){
////                               Text("血液検査項目を開く")
////                           }
////                           Spacer()
////                       }
////
////
////
////
////            //            Divider()
////
////
////            if(self.showBtListButtonBool){
////                Divider()
////                Button(action:{
////                    for list in self.DayDetailLists{
////                        print("\(self.dateFormatter.string(from:list.saveDate ?? Date()))")
////                        print("\(self.doneBtDate)")
////                        if self.dateFormatter.string(from:list.saveDate ?? Date()) == self.doneBtDate{
////                            print("date success")
////                            if let bun = list.bun{
////                                self.btDictionary["BUN"]?.append("\(bun)")
////                            }else{
////                                print("bun is Empty")
////                            }
////                            if let cre = list.cre{
////                                self.btDictionary["CRE"]?.append("\(cre)")
////                            }else{
////                                print("cre is Empty")
////                            }
////                            if let alt = list.alt{
////                                self.btDictionary["ALT(GPT)"]?.append("\(alt)")
////                            }else{
////                                print("alt is Empty")
////                            }
////                            if let ast = list.ast{
////                                self.btDictionary["AST(GOT)"]?.append("\(ast)")
////                            }else{
////                                print("ast is Empty")
////                            }
////                            if let alp = list.alp{
////                                self.btDictionary["ALP"]?.append("\(alp)")
////                            }else{
////                                print("alp is Empty")
////                            }
////                            if let ggt = list.ggt{
////                                self.btDictionary["GGT"]?.append("\(ggt)")
////                            }else{
////                                print("ggt is Empty")
////                            }
////                            if let tbil = list.tbil{
////                                self.btDictionary["T-Bil"]?.append("\(tbil)")
////                            }else{
////                                print("tbil is Empty")
////                            }
////                            if let nh = list.nh{
////                                self.btDictionary["NH3"]?.append("\(nh)")
////                            }else{
////                                print("nh is Empty")
////                            }
////                            if let tp = list.tp{
////                                self.btDictionary["TP"]?.append("\(tp)")
////                            }else{
////                                print("tp is Empty")
////                            }
////                            if let alb = list.alb{
////                                self.btDictionary["ALB"]?.append("\(alb)")
////                            }else{
////                                print("alb is Empty")
////                            }
////                            if let glu = list.glu{
////                                self.btDictionary["GLU"]?.append("\(glu)")
////                            }else{
////                                print("glu is Empty")
////                            }
////                            if let na = list.na{
////                                self.btDictionary["Na"]?.append("\(na)")
////                            }else{
////                                print("na is Empty")
////                            }
////                            if let k = list.k{
////                                self.btDictionary["K"]?.append("\(k)")
////                            }else{
////                                print("k is Empty")
////                            }
////                            if let cl = list.cl{
////                                self.btDictionary["Cl"]?.append("\(cl)")
////                            }else{
////                                print("cl is Empty")
////                            }
////                            if let ca = list.ca{
////                                self.btDictionary["Ca"]?.append("\(ca)")
////                            }else{
////                                print("ca is Empty")
////                            }
////                            if let ip = list.ip{
////                                self.btDictionary["IP"]?.append("\(ip)")
////                            }else{
////                                print("ip is Empty")
////                            }
////                            if let mg = list.mg{
////                                self.btDictionary["Mg"]?.append("\(mg)")
////                            }else{
////                                print("mg is Empty")
////                            }
////                            if let amy = list.amy{
////                                self.btDictionary["Amy"]?.append("\(amy)")
////                            }else{
////                                print("amy is Empty")
////                            }
////                            if let lip = list.lip{
////                                self.btDictionary["Lip"]?.append("\(lip)")
////                            }else{
////                                print("lip is Empty")
////                            }
////                            if let tg = list.tg{
////                                self.btDictionary["TG"]?.append("\(tg)")
////                            }else{
////                                print("tg is Empty")
////                            }
////                            if let tcho = list.tcho{
////                                self.btDictionary["Tcho"]?.append("\(tcho)")
////                            }else{
////                                print("tcho is Empty")
////                            }
////                            if let crp = list.crp{
////                                self.btDictionary["CRP"]?.append("\(crp)")
////                            }else{
////                                print("crp is Empty")
////                            }
////                            if let cpk = list.cpk{
////                                self.btDictionary["CK(CPK)"]?.append("\(cpk)")
////                            }else{
////                                print("cpk is Empty")
////                            }
////                            print(self.btDictionary)
////
////                            self.btListBool = true
////                            self.showBtListButtonBool = false
////                        }//if
////                        else{
////                            print("date error")
////                        }
////                    }//for in
////                }){
////                    Text("血液検査結果を見る")
////                }
////                Spacer()
////            }//if
////
////
////
////            if(self.btListBool){
////                VStack{
////                    Divider()
////                    Button(action:{
////                        self.btListBool = false
////                    }){Text("血液検査項目を閉じる")}
////                    Form{
////
////                        Group{
////
////                            if self.btDictionary["BUN"]?.isEmpty ?? false{}
////                            else{
////                                BtDayListView(btDayListDictionary: self.btDictionary["BUN"] ?? ["error"], btDayListSection: "BUN", btDayListUnits: BtListView().kidneyUnits["BUN"] ?? "error")
////                            }//else
////
////                            if self.btDictionary["CRE"]?.isEmpty ?? false{}
////                            else{
////                                BtDayListView(btDayListDictionary: self.btDictionary["CRE"] ?? ["error"], btDayListSection: "CRE", btDayListUnits: BtListView().kidneyUnits["CRE"] ?? "error")
////                            }//else
////
////                            if self.btDictionary["ALT(GPT)"]?.isEmpty ?? false{}
////                            else{
////                                BtDayListView(btDayListDictionary: self.btDictionary["ALT(GPT)"] ?? ["error"], btDayListSection: "ALT(GPT)", btDayListUnits: BtListView().kidneyUnits["ALT(GPT)"] ?? "error")
////                            }//else
////
////                            if self.btDictionary["AST(GOT)"]?.isEmpty ?? false{}
////                            else{
////                                BtDayListView(btDayListDictionary: self.btDictionary["AST(GOT)"] ?? ["error"], btDayListSection: "AST(GOT)", btDayListUnits: BtListView().kidneyUnits["AST(GOT)"] ?? "error")
////                            }//else
////
////                            if self.btDictionary["ALP"]?.isEmpty ?? false{}
////                            else{
////                                BtDayListView(btDayListDictionary: self.btDictionary["ALP"] ?? ["error"], btDayListSection: "ALP", btDayListUnits: BtListView().kidneyUnits["ALP"] ?? "error")
////                            }//else
////
////                            if self.btDictionary["GGT"]?.isEmpty ?? false{}
////                            else{
////                                BtDayListView(btDayListDictionary: self.btDictionary["GGT"] ?? ["error"], btDayListSection: "GGT", btDayListUnits: BtListView().kidneyUnits["GGT"] ?? "error")
////                            }//else
////
////                            if self.btDictionary["T-Bil"]?.isEmpty ?? false{}
////                            else{
////                                BtDayListView(btDayListDictionary: self.btDictionary["T-Bil"] ?? ["error"], btDayListSection: "T-Bil", btDayListUnits: BtListView().kidneyUnits["T-Bil"] ?? "error")
////                            }//else
////
////                            if self.btDictionary["NH3"]?.isEmpty ?? false{}
////                            else{
////                                BtDayListView(btDayListDictionary: self.btDictionary["NH3"] ?? ["error"], btDayListSection: "NH3", btDayListUnits: BtListView().kidneyUnits["NH3"] ?? "error")
////                            }//else
////
////                            if self.btDictionary["TP"]?.isEmpty ?? false{}
////                            else{
////                                BtDayListView(btDayListDictionary: self.btDictionary["TP"] ?? ["error"], btDayListSection: "TP", btDayListUnits: BtListView().kidneyUnits["TP"] ?? "error")
////                            }//else
////
////                            if self.btDictionary["ALB"]?.isEmpty ?? false{}
////                            else{
////                                BtDayListView(btDayListDictionary: self.btDictionary["ALB"] ?? ["error"], btDayListSection: "ALB", btDayListUnits: BtListView().kidneyUnits["ALB"] ?? "error")
////                            }//else
////
////                        }//Group
////                        Group{
////                        if self.btDictionary["GLU"]?.isEmpty ?? false{}
////                        else{
////                            BtDayListView(btDayListDictionary: self.btDictionary["GLU"] ?? ["error"], btDayListSection: "GLU", btDayListUnits: BtListView().kidneyUnits["GLU"] ?? "error")
////                        }//else
////
////                        if self.btDictionary["Na"]?.isEmpty ?? false{}
////                        else{
////                            BtDayListView(btDayListDictionary: self.btDictionary["Na"] ?? ["error"], btDayListSection: "Na", btDayListUnits: BtListView().kidneyUnits["Na"] ?? "error")
////                        }//else
////
////                        if self.btDictionary["K"]?.isEmpty ?? false{}
////                        else{
////                            BtDayListView(btDayListDictionary: self.btDictionary["K"] ?? ["error"], btDayListSection: "K", btDayListUnits: BtListView().kidneyUnits["K"] ?? "error")
////                        }//else
////
////                        if self.btDictionary["Cl"]?.isEmpty ?? false{}
////                        else{
////                            BtDayListView(btDayListDictionary: self.btDictionary["Cl"] ?? ["error"], btDayListSection: "Cl", btDayListUnits: BtListView().kidneyUnits["Cl"] ?? "error")
////                        }//else
////
////                        if self.btDictionary["Ca"]?.isEmpty ?? false{}
////                        else{
////                            BtDayListView(btDayListDictionary: self.btDictionary["Ca"] ?? ["error"], btDayListSection: "Ca", btDayListUnits: BtListView().kidneyUnits["Ca"] ?? "error")
////                        }//else
////
////                        if self.btDictionary["IP"]?.isEmpty ?? false{}
////                        else{
////                            BtDayListView(btDayListDictionary: self.btDictionary["IP"] ?? ["error"], btDayListSection: "IP", btDayListUnits: BtListView().kidneyUnits["IP"] ?? "error")
////                        }//else
////
////                            if self.btDictionary["Mg"]?.isEmpty ?? false{}
////                            else{
////                                BtDayListView(btDayListDictionary: self.btDictionary["Mg"] ?? ["error"], btDayListSection: "Mg", btDayListUnits: BtListView().kidneyUnits["Mg"] ?? "error")
////                            }//else
////
////                            if self.btDictionary["Amy"]?.isEmpty ?? false{}
////                            else{
////                                BtDayListView(btDayListDictionary: self.btDictionary["Amy"] ?? ["error"], btDayListSection: "Amy", btDayListUnits: BtListView().kidneyUnits["Amy"] ?? "error")
////                            }//else
////
////                            if self.btDictionary["Lip"]?.isEmpty ?? false{}
////                            else{
////                                BtDayListView(btDayListDictionary: self.btDictionary["Lip"] ?? ["error"], btDayListSection: "Lip", btDayListUnits: BtListView().kidneyUnits["Lip"] ?? "error")
////                            }//else
////
////                            if self.btDictionary["TG"]?.isEmpty ?? false{}
////                            else{
////                                BtDayListView(btDayListDictionary: self.btDictionary["TG"] ?? ["error"], btDayListSection: "TG", btDayListUnits: BtListView().kidneyUnits["TG"] ?? "error")
////                            }//else
////
////                        }//Group
////
////                        Group{
////                            if self.btDictionary["Tcho"]?.isEmpty ?? false{}
////                            else{
////                                BtDayListView(btDayListDictionary: self.btDictionary["Tcho"] ?? ["error"], btDayListSection: "Tcho", btDayListUnits: BtListView().kidneyUnits["Tcho"] ?? "error")
////                            }//else
////
////                            if self.btDictionary["CRP"]?.isEmpty ?? false{}
////                            else{
////                                BtDayListView(btDayListDictionary: self.btDictionary["CRP"] ?? ["error"], btDayListSection: "CRP", btDayListUnits: BtListView().kidneyUnits["CRP"] ?? "error")
////                            }//else
////
////                            if self.btDictionary["CK(CPK)"]?.isEmpty ?? false{}
////                            else{
////                                BtDayListView(btDayListDictionary: self.btDictionary["CK(CPK)"] ?? ["error"], btDayListSection: "CK(CPK)", btDayListUnits: BtListView().kidneyUnits["CK(CPK)"] ?? "error")
////                            }//else
////                        }//Group
////
////                    }//form
////
////
////
////                }//VStack
////
////            }//if
////            
//        }//VStack
//    }//body
//}//View
//
//struct BtDayListView:View{
//    
//    @State var btDayListDictionary:[String]
//    @State var btDayListSection:String
//    @State var btDayListUnits:String
//    var body:some View{
//        
//        Section(header:Text("\(self.btDayListSection)")){
//            ForEach (self.btDayListDictionary,id:\.self){ dayListData in
//                HStack{
//                    Text("\(dayListData)")
//                    Divider()
//                    Text("\( self.btDayListUnits)")
//                }//HStack
//                
//            }//ForEach
//        }//Section
//        
//        
//    }
//}
//
//
//
////struct DayDetailView_Previews: PreviewProvider {
////    static var previews: some View {
////        DayDetailView()
////    }
////}
