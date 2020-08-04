//
//  SavingImageView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/06/10.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI
import CoreData

struct SavingImageView: View {
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(
        entity: BtList.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath:\BtList.saveDate,ascending:false)],
        predicate: NSPredicate(format:"phototitle != %@","")//phototitleがnilじゃないものを選ぶ
    )
    var PhotoLists:FetchedResults<BtList>
    
    @State var image:Data = .init(count:0)
    
    @State var show = false
    
    var dateFormatter:DateFormatter{
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("yMMMMd")
        
        return formatter
    }
    //
    //    @State var photoTitle = ""
    //
    //    @State var description = ""
    
    var body: some View {
        NavigationView{
            List{
                ForEach(PhotoLists,id:\.self){list in
                    VStack{
                        //
                        //                    if list.phototitle != ""{
                        //                        Text("\(list.phototitle ?? "")")
                        //                    }
                        
                        if list.imageData?.count != nil && list.phototitle != ""{
                            Text("\(list.phototitle ?? "")").font(.headline).foregroundColor(.greyTitle)
                            ZStack{
                                Image("grey-icon")
                                    .resizable()
                                    .frame(width:UIScreen.main.bounds.width*9/10,height:UIScreen.main.bounds.width*9/10*4/3 )
                                    .cornerRadius(6)
                                
                                VStack{
                                    
                                    
                                    
                                    
                                    
                                    Image(uiImage:UIImage(data:list.imageData ?? self.image)!)
                                        .resizable()
                                        .frame(width:UIScreen.main.bounds.width*8/10,height:UIScreen.main.bounds.width*8/10*4/3 )
                                        .cornerRadius(6)
                                    
                                    
                                    
                                    //                        Text("\(list.descriptions ?? "")")
                                    //                            .foregroundColor(.greyText)
                                    ////
                                    //                        Text("\(list.photoTitle ?? "")")
                                    //                            .font(.caption)
                                    //                            .foregroundColor(.greyTitle)
                                }//VStack
                            }//ZStack
                            HStack{
                                Text("\(list.saveDate ?? Date(),formatter: self.dateFormatter)")
                                    .foregroundColor(.greyText)
                                
                                Spacer()
                            }//HStack
                        }//if
                            
                        else{
                            
                        }
                        
                    }//VStack
                        .navigationBarTitle("画像一覧",displayMode: .inline)
                    //           .navigationBarItems(trailing: Button(action:{
                    //                self.show.toggle()
                    //           }){
                    //              Image(systemName: "camera.fill")
                    //           } )
                }//ForEach
                    .onDelete{
                        indexSet in
                        for index in indexSet{
                            self.context.delete(self.PhotoLists[index])
                        }//indexSet
                }//onDelete
            }//List
            
            //                .sheet(isPresented: self.$show){
            //                    senderPhotoDataView().environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
            //            }
        }//NavigationView
        
    }//body
}//view

struct SavingImageView_Previews: PreviewProvider {
    static var previews: some View {
        SavingImageView()
    }
}

