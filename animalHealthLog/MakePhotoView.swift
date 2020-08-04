//
//  MakePhotoView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/06/10.
//  Copyright © 2020 Seiya. All rights reserved.
//

//import SwiftUI
//import CoreData
//
//struct MakePhotoView: View {
//    @Environment(\.managedObjectContext) var managedObjectContext
//    
//    @State var show = false
//    
//    var body: some View {
//        
//        VStack{
//            Spacer()
//        Text("新規登録")
//            
//            Button(action:{
//                self.show.toggle()
//            }){
//                Image(systemName: "camera.fill")
//            }//Button
//            .sheet(isPresented: self.$show){
//                senderPhotoDataView()
//           
//            }
//            Spacer()
//    }//VStack
//            
//    }//body
//}
//
//struct MakePhotoView_Previews: PreviewProvider {
//    static var previews: some View {
//        MakePhotoView()
//    }
//}
