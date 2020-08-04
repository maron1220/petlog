//
//  TweetHeaderView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/07/17.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct TweetHeaderView: View {
    var body: some View {
        ZStack{
            
            Color.gYellow
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/8)
            
            VStack{
                
                Text("ぺとケア")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                
                ZStack{
                    Color.white
                        .frame(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/25,alignment: .bottom)
                        .cornerRadius(10)
                    
                    HStack{
                    Text("tweet")
                        .foregroundColor(.black)
                        .font(.subheadline)
                    
                    
                    }//HStack
                }//VStack
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/18, alignment: .top)
                
            }
        }//ZStack
    }
}

struct TweetHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TweetHeaderView()
    }
}
