//
//  TweetLikeView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/07/14.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct TweetCellBottomView: View {
    var body: some View {
        HStack(spacing:40){
            Button(action:{
                
            }){
                Image(systemName: "message").font(.system(size: 20, weight: .regular)).frame(width: 20, height: 20)
            }.foregroundColor(.greyText)
            
            Button(action:{
                
            }){
                Image(systemName: "arrow.2.squarepath").font(.system(size: 20, weight: .regular)).frame(width: 20, height: 20)
            }.foregroundColor(.greyText)
            
            Button(action:{
                
            }){
                Image(systemName: "heart").font(.system(size: 20, weight: .regular)).frame(width: 20, height: 20)
            }.foregroundColor(.greyText)
            
            Button(action:{
                
            }){
                Image(systemName: "square.and.arrow.up").font(.system(size: 20, weight: .regular)).frame(width: 20, height: 20)
            }.foregroundColor(.greyText)
        }
    }
}

struct TweetCellBottomView_Previews: PreviewProvider {
    static var previews: some View {
        TweetCellBottomView()
    }
}
