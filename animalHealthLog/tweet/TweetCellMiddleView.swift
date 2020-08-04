//
//  TweetCellMiddleView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/07/14.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct TweetCellMiddleView: View {
    
    var likeWidth = UIScreen.main.bounds.width/2
    
    var pic = ""
    
    var body: some View {
        Image("grey-icon").resizable().frame(width:likeWidth,height: likeWidth*4/3).cornerRadius(20).padding()
    }
}

struct TweetCellMiddleView_Previews: PreviewProvider {
    static var previews: some View {
        TweetCellMiddleView()
    }
}
