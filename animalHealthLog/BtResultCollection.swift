//
//  BtResultCollection.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/04/04.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI


struct CollectionContainer:View {
    
    @State var collectionName = ""
    @State var subCollectionName = ""
    var body:some View{
        
        ZStack{
//            GeometryReader{ geometry in
            RoundedRectangle(cornerRadius: 20,style:.continuous).fill(Color.white).frame(width:UIScreen.main.bounds.width*0.9,height:150,alignment: .center)
            VStack{
                Text(self.collectionName).foregroundColor(Color .greyText).font(.largeTitle)
                    
                Text(self.subCollectionName).foregroundColor(Color .greyText).font(.title)
            
            }//Vstack
//            }//Geometry
        }//Zstack
            
    }
}

struct BtResultCollection: View {
    
   
//       @ObservedObject var barHidden:BarHiddenView
    
    init(){
        UINavigationBar.appearance().tintColor = UIColor.greyTitle
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.gGrey]
        UINavigationBar.appearance().backgroundColor = UIColor.greyBack
        
    }
    
//     @ObservedObject var barHidden = BarHidden()
    
    var body: some View {
        
        
        
        NavigationView{
            ZStack{
                Color.greyBack
                VStack{
                    
//                    Text("結果を表示")
                    
            ScrollView(.vertical,showsIndicators: false){
                
                VStack{
//                HStack{
                    
                    Spacer()
                NavigationLink(destination: kidneyResultTab().environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)){
                    CollectionContainer(collectionName: "腎機能" , subCollectionName: "BUN,CRE" )
                        
                }//NavigationLinkの閉じ
            
                NavigationLink(destination: liverResultTab().environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)){
                    CollectionContainer(collectionName: "肝機能" , subCollectionName: "ALT(GPT),AST(GOT),ALP \n GGT,T-Bil,NH3")
                }
//                }//HStack
                    
//                HStack{
                NavigationLink(destination: proteinResultTab().environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)){
                    CollectionContainer(collectionName: "蛋白" , subCollectionName: "TP,ALB")
                }
                NavigationLink(destination: glucoseResultTab().environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)){
                    CollectionContainer(collectionName: "血糖" , subCollectionName: "GLU")
                }
//                }//HStack
                
//                HStack{
                NavigationLink(destination: mineralResultTab().environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)){
                    CollectionContainer(collectionName: "電解質" , subCollectionName: "Na,K,Cl \n Ca,IP,Mg")
                }
                NavigationLink(destination: pancreaResultTab().environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)){
                    CollectionContainer(collectionName: "膵機能" , subCollectionName: "Amy,Lip")
                }
//                }//HStack
                
//                HStack{
                NavigationLink(destination: lipidResultTab().environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)){
                    CollectionContainer(collectionName: "脂質" , subCollectionName: "TG,Tcho")
                }
                NavigationLink(destination: inflammationResultTab().environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)){
                    CollectionContainer(collectionName: "炎症" , subCollectionName: "CRP")
                }
//                }//HStack
                
//                HStack{
                NavigationLink(destination: otherResultTab().environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)){
                    CollectionContainer(collectionName: "その他" , subCollectionName: "CPK")
                }
                    
//                }//HStack
            }//VStackの閉じ
                
            }//ScrollViewの閉じ
                
        }//NavigationViewの閉じ
                    
                .navigationBarTitle("血液検査一覧",displayMode: .inline)
                
            }//VStack
        }//ZStack
       
       
    }//bodyの閉じ
    
}//Viewの閉じ

struct BtResultCollection_Previews: PreviewProvider {
    static var previews: some View {
        BtResultCollection()
    }
}
