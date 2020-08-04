//
//  HeaderView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/07/07.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    
    var headerColor:Color
    var headerMenu:String
    
    var body: some View {
        ZStack{
            
            self.headerColor
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
                    
                    Text(self.headerMenu)
                        .foregroundColor(.black)
                        .font(.subheadline)
                }//VStack
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/18, alignment: .top)
                
            }
        }//ZStack
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(headerColor: .gYellow, headerMenu: "menu")
    }
}
