//
//  InputMenuView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/06/23.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI
import CoreData


struct InputMenuView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    func addMessage(){
        let newMessage = BtList(context: managedObjectContext)
        newMessage.id = UUID()
        newMessage.isComplete = false
        newMessage.message = registerMessage
        newMessage.saveDate = Date()
        do{
            try managedObjectContext.save()
        }catch{
            print(error)
        }
    }
    
    @State var registerMessage = ""
    @State var textFieldAlert = false
    
    @Binding var textFieldBool:Bool
    
    var textFieldWidth = UIScreen.main.bounds.width*9/10
    var body: some View {
        
        VStack{
            HeaderView(headerColor: .gGreen, headerMenu: "memo")
            
            VStack{
                MakeTextField(title: "#今日の体調,#獣医に聞きたいこと",text:self.$registerMessage)
                    .fixedSize()
                    .padding()
                
                HStack{
                    Spacer()
                    Button(action:{
                        self.textFieldBool.toggle()
                    }){
                        Text("キャンセル")
                    }
                    Spacer()
                    Button(action:{
                        self.textFieldAlert = true
                        //                    self.addMessage()
                        //                    print(self.registerMessage)
                        //                    self.registerMessage = ""
                        //                    UIApplication.shared.endEditing()
                        //                    print("\(self.registerMessage)です｡")
                    }){
                        Text("メモを保存する")
                        //                    Image(systemName: "plus.circle")
                        //                        .font(.title)
                        //                        .foregroundColor(.gYellow)
                    }
                    .alert(isPresented: self.$textFieldAlert){
                        Alert(
                            title: Text("\(self.registerMessage)"),
                            message: Text("追加しますか？"),
                            primaryButton: .cancel(Text("キャンセル")){
                                self.textFieldBool.toggle()
                            },
                            secondaryButton: .default(Text("追加")){
                                self.addMessage()
                                print(self.registerMessage)
                                UIApplication.shared.endEditing()
                                print("\(self.registerMessage)です｡")
                                self.textFieldBool.toggle()
                            }
                        )
                    }
                    .disabled(self.registerMessage.isEmpty)
                    Spacer()
                }
                Spacer()
                
            }//VStack
            Spacer()
        }//VStack
    }//body
}//View


struct InputMenuView_Previews: PreviewProvider {
    static var previews: some View {
        InputMenuView(textFieldBool: .constant(false))
    }
}
