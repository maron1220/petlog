//
//  PhotoZoomView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/06/20.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI



struct PhotoZoomView: View {
    
    @Binding var zoomPhotoImage:Data
    @Binding var zoomPhotoTitle:String
    
    var zoomPhotoWidth = UIScreen.main.bounds.width
    var backImageWidth = UIScreen.main.bounds.width

    var body: some View {
        ZStack{
            Color.black
//        Image("grey-icon")
//        .resizable()
//            .frame(width:self.backImageWidth,height:self.backImageWidth*4/3 )
//        .cornerRadius(6)
            VStack{
        Image(uiImage:UIImage(data:self.zoomPhotoImage)!)
        .resizable()
            .frame(width:self.zoomPhotoWidth,height:self.zoomPhotoWidth*4/3 )
        
                
//                Text("\(self.zoomPhotoTitle)")
//                    .font(.largeTitle)
        }//VStack
        }//ZStack
    }
}

