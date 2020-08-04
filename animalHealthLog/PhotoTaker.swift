//
//  PhotoTaker.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/06/30.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI
import Combine

struct PhotoTaker: UIViewControllerRepresentable{
    
    @Binding var show:Bool
    @Binding var image:Data
    
    func makeCoordinator() -> PhotoTaker.Coordinator {
        return PhotoTaker.Coordinator(child1:self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<PhotoTaker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        if !UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .photoLibrary
        }
        else{
            picker.sourceType = .camera
        }
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<PhotoTaker>) {
        
    }
    
    class Coordinator:NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
        var child:PhotoTaker
        
        init(child1:PhotoTaker) {
            child = child1
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.child.show.toggle()
        }
        
        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info:[UIImagePickerController.InfoKey:Any] ) {
            let image = info[.originalImage] as! UIImage
            let data = image.jpegData(compressionQuality: 0.45)
            
            self.child.image = data!
            self.child.show.toggle()
        }
    }
    
    
    
    
    
    
}

