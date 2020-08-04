//
//  takePhotoView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/06/30.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct takePhotoView: View {
    
    @ObservedObject var keyboard = KeyboardObserver()
    
    @Environment(\.managedObjectContext) var context
    
    @State var cameraImage:Data = .init(count:0)
    
    @State var  showCamera = false
    
    @State private var showCameraAlert = false
    
    @State var cameraTitle = ""
    
    var viewsWidth = UIScreen.main.bounds.width
    
    var photoWidth = UIScreen.main.bounds.width*6/10
    
    @Binding var photoBool:Bool
    
    func  addCameraImage() {
        let newaddCameraImage = BtList(context: context)
        newaddCameraImage.id = UUID()
        newaddCameraImage.isComplete = false
        //        if image.count != 0{
        newaddCameraImage.imageData = cameraImage
        newaddCameraImage.phototitle = cameraTitle
        //        }
        newaddCameraImage.saveDate = Date()
        do{
            try context.save()
        }catch{
            print(error)
        }
    }
    
    var body: some View {
        VStack{
            HeaderView(headerColor: .gBlue, headerMenu: "photo")
            Spacer()
             MakeTextField(title:"#タイトル",text: self.$cameraTitle)
                                //            .fixedSize()
                                
            //                    .background(Color.greyBack)
                                .cornerRadius(6)
                                .frame(width:UIScreen.main.bounds.width*8/10,height: UIScreen.main.bounds.height/15)
            Spacer()
            if self.cameraImage.count != 0{
                VStack{
                Button(action:{
                    self.showCamera.toggle()
                }){
                    Image(uiImage:UIImage(data:self.cameraImage)!)
                        .renderingMode(.original)
                        .resizable()
                        //                    .scaledToFit()
                        .frame(width:photoWidth,height:photoWidth*4/3 )
                        .cornerRadius(6)
                }//Button
                    Button(action:{
                        self.self.cameraImage.count = 0
                    }){
                        Text("キャンセル")
                            //                    .scaledToFit()
                            
                            .cornerRadius(6)
                    }//Button
                }//VStack
            }//if
            else{
                Button(action:{
                    self.showCamera.toggle()
                }){
                    ZStack{
                        Image("grey-icon")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width:photoWidth,height:photoWidth*4/3 )
                            .cornerRadius(6)
                        Image(systemName: "camera").font(.system(size: 100, weight: .regular))
                            .foregroundColor(.gBlue)
                    }//Button
                }
            }
            
            Spacer()
            
            VStack{
               
             
                
                if (self.cameraImage.count != 0 && self.cameraTitle != ""){
                    Button(action:{
                        
                        self.showCameraAlert = true
                        
                        print("success")
                        
                        
                    }){
                        Text("保存する！")
                            .fixedSize()
                            .frame(width:UIScreen.main.bounds.width/4,height: 30)
                            .foregroundColor((self.cameraImage.count != 0
                                
                                ) ? Color.white : Color.black
                        )
                            .background((self.cameraImage.count != 0
                                ) ? Color.blue : Color.greyBack)
                            .cornerRadius(13)
                    }
                    .alert(isPresented: self.$showCameraAlert){
                        Alert(
                            title:Text("画像"),
                            message: Text("追加しますか？"),
                            primaryButton: .cancel(Text("キャンセル")){
                                //                                    self.image.count = 0
                                self.photoBool.toggle()
                            },
                            secondaryButton: .default(Text("追加")){
                                self.addCameraImage()
                                self.cameraImage.count = 0
                                //                                    self.addPhotoTitle()
                                self.cameraTitle = ""
                                self.photoBool.toggle()
                            }
                        )
                        
                    }
                }//if
                else if (self.cameraImage.count != 0 && self.cameraTitle == ""){
                    Text("タイトルを入力しよう!")
                }//else if
                else if (self.cameraImage.count == 0 && self.cameraTitle != ""){
                    Text("写真を撮ろう!")
                }//else if second
                else{
                    Text("気になる様子を写真に撮ろう!").foregroundColor(.gBlue)
                }
              
            }//VStack
                .sheet(isPresented: self.$showCamera, content: {
                    PhotoTaker(show: self.$showCamera, image: self.$cameraImage)
                })
               
            Spacer()
        }//HStack
            .frame(width: self.viewsWidth)
        .onAppear{
                self.keyboard.startObserve()
        }.onDisappear{
            self.keyboard.stopObserve()
        }.padding(.bottom,keyboard.keyboardHeight)
            .animation(.easeOut)
    }
    
}


struct takePhotoView_Previews: PreviewProvider {
    static var previews: some View {
        takePhotoView(photoBool: .constant(true))
    }
}
