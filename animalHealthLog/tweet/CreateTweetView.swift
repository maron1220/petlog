//
//  CreateTweetView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/07/14.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct CreateTweetView: View {
    
    @Binding var show:Bool
    @State var txt = ""
    
    var body: some View {
        VStack{
            HeaderView(headerColor: .gGreen, headerMenu: "tweet")
            
            
            HStack{
                Button(action:{
                    self.show.toggle()
                }){
                    Text("Cancel")
                }
                
                Spacer()
                
                Button(action:{
                    
                    postTweet(msg: self.txt)
                    self.show.toggle()
                    
                }){
                    Text("投稿").bold().padding()
                }.background(Color.gBlue)
                    .foregroundColor(.white)
                .clipShape(Capsule())
            }//HStack
           
            MultilineTextFieldView(txt: $txt)
             
        }//VStack
        
    }
}

struct CreateTweetView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTweetView(show: .constant(false))
    }
}
