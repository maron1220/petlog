//
//  RoundedRectangleView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/07/07.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct RoundedRectangleView: View {
    
    var roundedColors:Color
    
    var roundedWidth = UIScreen.main.bounds.width/2.7
    
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .fill(self.roundedColors)
            .frame(width:self.roundedWidth,height: self.roundedWidth)
    }
}

struct RoundedRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectangleView(roundedColors: .red)
    }
}
