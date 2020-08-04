//
//  UIApplication+extension.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/04/01.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

extension UIApplication{
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder),to: nil, from: nil, for: nil)
    }
}
