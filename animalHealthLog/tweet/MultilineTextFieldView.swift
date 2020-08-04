//
//  MultilineTextFieldView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/07/14.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct MultilineTextFieldView: UIViewRepresentable {
    
    @Binding var txt : String
    
    func makeCoordinator() -> MultilineTextFieldView.Coordinator {
        
        return MultilineTextFieldView.Coordinator(parent1:self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<MultilineTextFieldView>) -> MultilineTextFieldView.UIViewType {
        let text = UITextView()
        text.isEditable = true
        text.isUserInteractionEnabled = true
        text.text = "気になることを投稿しよう!"
        text.textColor = .greyText
        text.font = .systemFont(ofSize: 20)
        text.delegate = context.coordinator
        return text
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<MultilineTextFieldView>) {
        
    }
    
    class Coordinator:NSObject,UITextViewDelegate{
        
        var parent:MultilineTextFieldView
        
        init(parent1:MultilineTextFieldView) {
            parent = parent1
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            textView.text = ""
            textView.textColor = .greyText
        }
        
        func textViewDidChange(_ textView: UITextView) {
            
            self.parent.txt = textView.text
            
        }
        
    }
}

