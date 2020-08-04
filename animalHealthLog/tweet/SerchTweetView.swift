//
//  SerchTweetView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/07/14.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI
import Firebase

struct SerchTweetView: View {
    
    @ObservedObject var datas = getTopTags()
    
    var searchBarWidth = UIScreen.main.bounds.width
    
    var body: some View {
        VStack{
        
       HStack{
        SearchBar().frame(width:self.searchBarWidth/1.4)
       
       Button(action:{
           print("search")
       }){
           Image(systemName: "person.crop.circle.badge.plus").font(.system(size: 30, weight: .regular))
       }.foregroundColor(.gBlue)
       }//HStack

            
            List(datas.top){i in
            
                SearchCellView(tag: i.tag, tweets: i.tweets)
            
        }//List
                }//VStack
    }
}

struct SearchBar:UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar{
        
        let search = UISearchBar()
        return search
    }
    
    func updateUIView(_ uiView: SearchBar.UIViewType, context: UIViewRepresentableContext<SearchBar>) {
        
    }
}

class getTopTags: ObservableObject {
    
    @Published var top = [TopDatatype]()
    
    init() {
        let db = Firestore.firestore()
        
        db.collection("Top").order(by: "tweets",descending: true).getDocuments{
            (snap,err) in
            
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }//if
            
            for i in snap!.documents{
                let id = i.documentID
                let tag = i.get("tag") as! String
                let tweets = i.get("tweets") as! NSNumber
                
                self.top.append(TopDatatype(id: id, tag: tag, tweets: "\(tweets)"))
            }//for
            
        }//db
    }//init
    
}

struct TopDatatype : Identifiable{
    
    var id : String
    var tag : String
    var tweets : String
    
}



struct SerchTweetView_Previews: PreviewProvider {
    static var previews: some View {
        SerchTweetView()
    }
}
