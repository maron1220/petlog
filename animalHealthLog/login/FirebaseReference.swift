//
//  FirebaseReference.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/07/11.
//  Copyright © 2020 Seiya. All rights reserved.
//

import Foundation
import FirebaseFirestore

enum FCollectionReferencs:String{
    case User
    }

func FirebaseReference(_ collectionReference:FCollectionReferencs) -> CollectionReference{
    
    return Firestore.firestore().collection(collectionReference.rawValue)

}
