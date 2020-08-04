//
//  MultilineTextView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/06/23.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct MultilineField:UIViewRepresentable{
    
    @Binding var text:String
    
    let onEditingChanged:(Bool) -> Void
    
    init(text:Binding<String>,onEditingChanged:@escaping(Bool) -> Void = {_ in}){
        self._text = text
        self.onEditingChanged = onEditingChanged
    }
    
    func makeCoordinator() -> MultilineFieldCoodinator{
        MultilineFieldCoodinator(target:self,onEditingChanged:onEditingChanged)
    }
    
    func makeUIView(context:Context) -> UITextView{
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.text = text
        return textView
    }
    
    func updateUIView(_ textView:UITextView,context:Context){
        if textView.text != text{
            textView.text = text
        }
    }
}//MultilineField

class MultilineFieldCoodinator: NSObject,UITextViewDelegate {
    let target:MultilineField
    let onEditingChanged:(Bool) -> Void
    
    init(target:MultilineField,onEditingChanged:@escaping(Bool) -> Void = {_ in}) {
        self.target = target
        self.onEditingChanged = onEditingChanged
    }
    
    func textViewDidChange(_ textView: UITextView) {
        target.text = textView.text
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        onEditingChanged(true)
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        onEditingChanged(false)
    }
    
}
