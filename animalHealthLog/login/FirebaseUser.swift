//
//  FirebaseUser.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/07/11.
//  Copyright © 2020 Seiya. All rights reserved.
//


import Foundation
import FirebaseAuth

class FUser{
    
    let id:String
    var email:String
    var firstName:String
    var lastName:String
    var fullName:String
    var phoneNumber:String
    
    var fullAddress:String?
    var onBoarding:Bool
    
    init(_id:String,_email:String,_firstName:String,_lastName:String,_phoneNumber:String) {
        id = _id
        email = _email
        firstName = _firstName
        lastName = _lastName
        fullName = firstName + "" + lastName
        phoneNumber = _phoneNumber
        onBoarding = false
    }
    
    class func currentId() -> String{
        
        return Auth.auth().currentUser!.uid
    }
    
    class func currentUser() -> FUser?{
        
        if Auth.auth().currentUser != nil{
            if let dictionary = userDefaults.object(forKey:kCURRENTUSER){
                return nil
            }
        }
        
        return nil
    }
    
    class func loginUserWith(email:String,password:String,completion:@escaping(_ error:Error?, _ isEmailVerified:Bool) -> Void){
        
        Auth.auth().signIn(withEmail: email,password: password){
            (authDataResult,error) in
            if error == nil {
                
                if authDataResult!.user.isEmailVerified{
                    
                    //download fuser object and save it locally
                    
                }else{
                    completion(error,false)
                }
                
            }else{
                completion(error,false)
            }
        }
    }
    
    class func registerUserWith(email:String,password:String,completion:@escaping(_ error:Error?) -> Void){
        
        Auth.auth().createUser(withEmail:email,password:password){(authDataResult, error) in
            
            completion(error)
            
            if error == nil {
                
                authDataResult!.user.sendEmailVerification{(error) in
                    print("verification email sent error:",error?.localizedDescription)
                }
            }
            
        }
        
    }
    
}
        
    

