//
//  SearchCellView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/07/14.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct SearchCellView: View {
    
    var tag = ""
    var tweets = ""
    
    var body: some View {
        VStack(alignment:.leading,spacing:5){
            Text(tag).fontWeight(.heavy)
            Text(tweets + " Tweets").fontWeight(.light)
        }
    }
}

struct SearchCellView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCellView()
    }
}
