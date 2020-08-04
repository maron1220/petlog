//
//  ProfileRegisterView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/05/21.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct ProfileRegisterView: View {
    @ObservedObject var petName:ProfileViewModel
    
    @Binding var isPresent:Bool
    
    var body: some View {
        NavigationView{
            VStack{
            Form{
                Section(header:Text("What is your pet name ?")){
                    TextField("Pet name",text:$petName.name )
                }//Section end
            }//Form end
                .navigationBarTitle("MyPage",displayMode: .inline)
            
                Button(action:{
                    self.isPresent = false
                }){
                    Text("Done")
                }
            
            }//VStack
        }//NavigationView end
    }//body end
}//View end

//struct ProfileRegisterView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileRegisterView(petName: self.$petName, isPresent: true?)
//    }
//}
