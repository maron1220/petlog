//
//  PetConditionRegisterView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/06/23.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct ButtonTextView:View{
    
    var buttonText:String
    
    var buttonImage:Image
    
     var buttonTextWidth = UIScreen.main.bounds.width/3.5
    
    var buttonTextHeight = UIScreen.main.bounds.width/3.5/2
    
    
    var body:some View{
        VStack{
            Text(self.buttonText)
            .foregroundColor(.white)
            .font(.title)
        .bold()
                .frame(width: self.buttonTextWidth, height:self.buttonTextHeight, alignment: .leading)
            self.buttonImage.font(.system(size: 60, weight: .regular))
            .frame(width: self.buttonTextWidth, height: self.buttonTextHeight, alignment: .trailing)
            .foregroundColor(.white)
        }
    }
}

struct PetConditionRegisterView: View {
    
    var imageWidth = UIScreen.main.bounds.width/1.2
    
    var imageHeight = UIScreen.main.bounds.height/3.5/2
    
    @State var textBool = false
    
    @State var photoBool = false
    
    @State var photoLibraryBool = false
    
    @State var testBool = false
    
    var body: some View {
//        NavigationView{
//        ZStack{
//            Image("yellow-icon")
//            .resizable()
//            .frame(width:self.imageWidth,height: self.imageWidth)
//                .opacity(0.3)
        ScrollView{
            VStack{
                TopHeaderView(headerText: "ぺとケア")
                
                    Spacer()
   
                Text("ペットの体調や気になることをメモしよう！")
                    
                    .foregroundColor(.gGrey)
                Spacer()
                VStack{
                    Text("記録しよう!")
                        .font(.title)
                    .bold()
                        .frame(width: self.imageWidth, height: 50, alignment: .leading)
                HStack{
                    Spacer()
                    ZStack{
                        RoundedRectangleView(roundedColors: .gGreen)
                Button(action:{
                    self.textBool.toggle()
               }){
                ButtonTextView(buttonText: "memo", buttonImage:Image(systemName: "square.and.pencil"))
                }
                .sheet(isPresented: self.$textBool, content: {InputMenuView(textFieldBool: self.$textBool).environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)})
                    }//ZStack
                    Spacer()
                    ZStack{
                        RoundedRectangleView(roundedColors: .gGreen)
                    Button(action:{
                        self.testBool.toggle()
                    }){
                        ButtonTextView(buttonText: "test", buttonImage: Image(systemName: "doc.append"))
                    }
                    .sheet(isPresented: self.$testBool, content: {BtListView().environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)})
                    }//ZStack
                    Spacer()
                }//HStack
            
                HStack{
                    Spacer()
                    ZStack{
                        RoundedRectangleView(roundedColors: .gBlue)
                Button(action:{
                    self.photoBool.toggle()
                }){
                    ButtonTextView(buttonText: "camera", buttonImage: Image(systemName: "camera"))
                }
                .sheet(isPresented: self.$photoBool, content: {takePhotoView(photoBool: self.$photoBool).environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)})
//                takePhotoView()
//                Divider()
                    }//ZStack
                    Spacer()
                    ZStack{
                        RoundedRectangleView(roundedColors: .gBlue)
                Button(action:{
                    self.photoLibraryBool.toggle()
                }){
                    ButtonTextView(buttonText: "library", buttonImage: Image(systemName: "camera.on.rectangle"))
                }
                .sheet(isPresented: self.$photoLibraryBool, content: {senderPhotoDataView( photoLibraryBool: self.$photoLibraryBool).environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)})
                    }//ZStack
                    Spacer()
                }//HStack
                Spacer()
                }//VStack
            }//VStack
        }
//        }//ZStack
    }
        
}

struct PetConditionRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        PetConditionRegisterView()
    }
}
