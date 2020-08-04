//
//  LoginView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/07/09.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @State var showingSignup = false
    
    @State var email = ""
    @State var password = ""
    @State var repeatPassword = ""
    
    var body: some View {
        VStack{
            Text("Sign In")
                .fontWeight(.heavy)
                .font(.largeTitle)
                .padding([.bottom,.top],20)
            
            
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    Text("Email")
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(Color.init(.label))
                        .opacity(0.75)
                    
                    TextField("Enter your email", text: $email)
                    Divider()
                    
                    Text("Password")
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(Color.init(.label))
                        .opacity(0.75)
                    
                    SecureField("Enter your password(6文字以上)", text: $password)
                    Divider()
                    
                    if showingSignup{
                        Text("Repeat Password")
                            .font(.headline)
                            .fontWeight(.light)
                            .foregroundColor(Color.init(.label))
                            .opacity(0.75)
                        
                        SecureField("Repeat password", text: $repeatPassword)
                        Divider()
                    }
                }.padding(.bottom,15)
                    .animation(.easeOut(duration:0.1))
                //VStack
                
                HStack{
                    
                    Spacer()
                    
                    Button(action:{
                        
                        self.resetPassword()
                    }){
                        Text("Forgot password")
                            .foregroundColor(Color.greyText.opacity(0.5))
                    }
                }//HStack
                
            }.padding(.horizontal,6)//VStack
            
            Button(action:{
                self.showingSignup ? self.signUpUser() : self.loginUser()
            }){
                Text(showingSignup ? "Sign Up" : "Sign In")
                    .foregroundColor(.white)
                    .frame(width:UIScreen.main.bounds.width - 120)
                    .padding()
            }//Button
                .background(Color.gYellow)
                .clipShape(Capsule())
                .padding(.top,45)
            
            SignUpView(showingSignup: self.$showingSignup)
            
        }//VStack
    }//body
    
    private func loginUser(){
        
    }
    
    private func signUpUser(){
        
        if email != "" && password != "" && repeatPassword != ""{
            if password == repeatPassword{
                
                FUser.registerUserWith(email: email, password: password){(error) in
                    
                    if error != nil {
                        print("Error registering user:", error?.localizedDescription)
                        return
                    }
                    print("user has been created")
                    //go back to the app
                    //check if user onboading is done
                }
                
            }else{
                print("passwords dont match")
            }
            
            
        } else {
            print("Email and password must be set")
        }
        
    }
    
    private func resetPassword(){
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct SignUpView:View {
    
    @Binding var showingSignup:Bool
    
    var body: some View{
        
        VStack{
            
            Spacer()
            
            HStack(spacing:8){
                Text("Don't have an Account?")
                    .foregroundColor(Color.greyText.opacity(0.5))
                
                Button(action:{
                    self.showingSignup.toggle()
                }){
                    Text("Sign up")
                }
                .foregroundColor(.gYellow)
            }//HStack
                .padding(.top,25)
            
        }//VStack
        
    }
}
