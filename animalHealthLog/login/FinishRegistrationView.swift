//
//  FinishRegistrationView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/07/10.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct FinishRegistrationView: View {
    
    @State var name = ""
     @State var surname = ""
     @State var telephone = ""
     @State var address = ""
    
    var body: some View {
        Form{
            Section(){
                
                Text("Finish Registration")
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                    .padding([.top,.bottom],20)
                
                TextField("Name",text: $name)
                TextField("Surname",text: $surname)
                TextField("Telephone",text: $telephone)
                TextField("Address",text: $address)
                
            }//Section
            
            Section(){
                
                Button(action:{
                    self.finishregistration()
                }){
                    Text("Finish Registration")
                }
            }.disabled(self.fieldsCompleted())
            
        }//Form
    }
    
    private func fieldsCompleted() -> Bool{
        
        return self.name != "" && self.surname != "" && self.telephone != "" && self.address != ""
    }
    
    private func finishregistration(){
        
    }
}

struct FinishRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        FinishRegistrationView()
    }
}
