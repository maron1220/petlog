//
//  TopHeaderView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/07/07.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct TopHeaderView: View {
    
    var headerText:String
    
    var body: some View {
        ZStack{
            Color.gYellow
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/8, alignment: .top)
                .edgesIgnoringSafeArea(.all)
            Text(self.headerText)
                .font(.title)
                .foregroundColor(.white).bold()
        }//ZStack
        
    }
}

struct TopHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TopHeaderView(headerText: "title")
    }
}
