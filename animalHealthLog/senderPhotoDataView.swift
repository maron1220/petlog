//
//  senderPhotoDataView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/06/10.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI
import CoreData

struct senderPhotoDataView: View {
    
    @Environment(\.managedObjectContext) var context
    
    @Binding var photoLibraryBool:Bool
    
    @State var image:Data = .init(count:0)
    
    @State var show = false
    
    @State private var showImageAlert = false
    
    @State var photoTitle = ""
    
    func  addImageAndTitle() {
        let newImageAndTitle = BtList(context: context)
        newImageAndTitle.id = UUID()
        newImageAndTitle.isComplete = false
        //        if image.count != 0{
        newImageAndTitle.imageData = image
        newImageAndTitle.phototitle = photoTitle
        //        }
        newImageAndTitle.saveDate = Date()
        do{
            try context.save()
        }catch{
            print(error)
        }
    }
    
    var body: some View {
        VStack{
            HeaderView(headerColor: .gBlue, headerMenu: "library")
            
            Spacer()
                     
                                MakeTextField(title:"#タイトル",text: self.$photoTitle)
//                                    .padding(5)
//                                 .background(Color.gBlue)
                                
                                    .frame(width:UIScreen.main.bounds.width*8/10,height: UIScreen.main.bounds.height/15)
                                    .cornerRadius(6)
            Spacer()
            
            if self.image.count != 0{
                Button(action:{
                    self.show.toggle()
                }){
                    Image(uiImage:UIImage(data:self.image)!)
                        .renderingMode(.original)
                        .resizable()
                        //                    .scaledToFit()
                        .frame(width:UIScreen.main.bounds.width*6/10,height:UIScreen.main.bounds.width*6/10*4/3 )
                        .cornerRadius(6)
                }//Button
            }//if
            else{
                Button(action:{
                    self.show.toggle()
                }){
                    ZStack{
                    Image("grey-icon")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width:UIScreen.main.bounds.width*6/10,height:UIScreen.main.bounds.width*6/10*4/3 )
//                        .border(Color.gBlue,width: 5)
//                        .cornerRadius(6)
                        Image(systemName: "camera.on.rectangle").font(.system(size: 100, weight: .regular))
                            .foregroundColor(.gBlue)
                    }//ZStack
                }//Button
            }
            
            
         
            
            Spacer()
            
            if (self.image.count != 0 && self.photoTitle != ""){
                Button(action:{
                   
                    self.showImageAlert = true
                    
                    print("success")
                    
                }){
                    Text("保存する！")
                        .fixedSize()
                        .frame(width:250,height: 30)
                        .foregroundColor((self.image.count != 0
                          
                            ) ? Color.white : Color.black
                    )
                        .background((self.image.count != 0
                            
                            ) ? Color.blue : Color.greyBack)
                        .cornerRadius(13)
                }
                .alert(isPresented: self.$showImageAlert){
                    Alert(
                        title:Text("画像"),
                        message: Text("追加しますか？"),
                        primaryButton: .cancel(Text("キャンセル")){
                            self.photoLibraryBool.toggle()
                        },
                        secondaryButton: .default(Text("追加")){
                            self.addImageAndTitle()
                            self.image.count = 0
                            self.photoTitle = ""
                            self.photoLibraryBool.toggle()
                        }
                    )
                    
                }
            }//if
            else if (self.image.count != 0 && self.photoTitle == ""){
                Text("タイトルを入力してください")
            }//else if
            else if (self.image.count == 0 && self.photoTitle != ""){
                Text("写真を選んでください")
            }//else if second
            else{
                Text("写真を登録!").foregroundColor(.gBlue)
            }
            Spacer()
        }//VStack
            .sheet(isPresented: self.$show, content: {
                ImagePicker(show: self.$show, image: self.$image)
            })
    
    }//body
}//View


struct senderPhotoDataView_Previews: PreviewProvider {
    static var previews: some View {
        senderPhotoDataView(photoLibraryBool: .constant(true))
    }
}
