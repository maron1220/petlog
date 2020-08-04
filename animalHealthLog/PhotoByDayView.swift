//
//  PhotoByDayView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/06/27.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI

struct PhotoByDayView: View {
    
    @FetchRequest(
        entity: BtList.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath:\BtList.saveDate,ascending:true),
        ],
        predicate: NSPredicate(format:"phototitle != %@ " ,"")
    )
    var DayPhotoData:FetchedResults<BtList>
    
    var dateFormatter:DateFormatter{
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("yMMMMdEEEE")
        
        return formatter
    }
    
    var imageWidth = UIScreen.main.bounds.width*4/10
    var imageheight = UIScreen.main.bounds.width*4/10*4/3
    
    @Binding var donePhotoDate:String
    
    @State var dayPhotoImage:Data = UIImage(imageLiteralResourceName: "grey-icon").pngData()!
    @State var dayPhotoTitle:String = ""
    
    @State var zoomAppear = false
    
    var body: some View {
       
            
                ScrollView(.horizontal,showsIndicators: false){
                     
                    HStack{
                        Spacer()
                        ForEach(DayPhotoData){photodata in
                        if (self.dateFormatter.string(from:photodata.saveDate ?? Date()) == self.donePhotoDate && photodata.imageData != nil){
                            
                            ZStack{
                                
                                Image(uiImage:UIImage(data:photodata.imageData ?? self.dayPhotoImage)!)
                                    .resizable()
                                    .frame(width:self.imageWidth,height:self.imageheight )
                                    .cornerRadius(6)
                                    .onTapGesture {
                                        self.dayPhotoImage = photodata.imageData ?? self.dayPhotoImage
                                        self.dayPhotoTitle = photodata.phototitle ?? ""
                                        self.zoomAppear.toggle()
                                        
                                }
                                .sheet(isPresented: self.$zoomAppear){ PhotoZoomView(zoomPhotoImage:self.$dayPhotoImage,zoomPhotoTitle: self.$dayPhotoTitle)
                                }
                                
                                Text("\(photodata.phototitle ?? "")").foregroundColor(.white)
                                
                            }//ZStack
                            
                        }//if
                            }//ForeEach
                        
                        Spacer()
                    }//HStack
                }//ScrollView
            
            
            
        
    }
}

struct PhotoByDayView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoByDayView(donePhotoDate: .constant("sample"))
    }
}
