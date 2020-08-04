//
//  ListContainer.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/04/14.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI
import CoreData

extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
}

struct ListFirstContainer: View{
    @State var categoryName = ""
    var body:some View{
        
        HStack{
            Text(self.categoryName)
                .frame(width: UIScreen.screenWidth/5)
            Divider()
        }//HStack
        
    }
}

struct addExamContainer:View {
    @State var btUnitValue = ""
    
    var body:some View{
        HStack{
        Divider()
        Text(btUnitValue)
            .frame(width: UIScreen.screenWidth/5)
            
        Divider()
        
    }
    }
}

struct ListSecondContainer: View{
    @State var btUnitValue = ""
    @State var btCriteriaValue = ""
    var body:some View{
        HStack{
        
        Divider()
            Text(btCriteriaValue)
                .frame(width: UIScreen.screenWidth/5)
            Divider()
            Text(btUnitValue)
            .frame(width: UIScreen.screenWidth/5)
        
    }
    }
}

struct ListContainer: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ListContainer_Previews: PreviewProvider {
    static var previews: some View {
        ListContainer()
    }
}
