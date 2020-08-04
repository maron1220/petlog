//
//  TweetCellView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/07/14.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct TweetCellTopView: View {
    
    var name = ""
    var id = ""
    var pic = ""
    var image = ""
    var msg = ""
    
    var body: some View {
       
            
            VStack(alignment: .leading){
                Text(name).fontWeight(.heavy)
                Text(id)
                Text(msg).padding(.top,8)
                
                 
               
            }//VStack
            
        
    }
}

struct TweetCellTopView_Previews: PreviewProvider {
    static var previews: some View {
        TweetCellTopView()
    }
}
