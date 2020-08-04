//
//  MyPageView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/04/15.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct MyPageView: View {
    @State var showProfileRegisterView = false
    @ObservedObject var petName = ProfileViewModel()
    
    var body: some View {
        VStack{
        HStack{
            VStack{
                Text("動物名").font(.largeTitle)
                Text("Age").font(.caption)
            }//VStack end
            VStack{
                Text("\(self.petName.name)").font(.largeTitle)
                Text("シーズー").font(.caption)
            }//VStack end
        }//HStack end
            Button(action:{
                self.showProfileRegisterView.toggle()
            }){
                Text("Register profile")
            }//Button
    }//VStack large end
            .sheet(isPresented: self.$showProfileRegisterView){
                ProfileRegisterView(petName:self.petName, isPresent: self.$showProfileRegisterView)
        }//sheet end
}//body end
}//View end

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
