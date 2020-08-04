    //
    //  TweetView.swift
    //  animalHealthLog
    //
    //  Created by 細川聖矢 on 2020/07/14.
    //  Copyright © 2020 Seiya. All rights reserved.
    //
    
    import SwiftUI
    import Firebase
    
    struct TweetView: View {
        
        var likeWidth = UIScreen.main.bounds.width/6
        
        @ObservedObject var observedData = getData()
        @State var show = false
        
        var body: some View {
            VStack{
                  ZStack{
                          
                          Color.gYellow
                              .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/8)
                          
                          VStack{
                              Text("ぺとケア")
                                  .font(.title)
                                  .bold()
                                  .foregroundColor(.white)
                              
                            HStack{
                                
                                Spacer()
                                
                                Button(action:{
                                                                       
                                                                       self.show.toggle()
                                                                       
                                                                   }){
                                                                       Image(systemName: "plus").font(.system(size: 35, weight: .semibold)).frame(width:20,height: 20).padding()
                                                                   }
                                                                   .background(Color.gGreen)
                                                                   .foregroundColor(.white)
                                                                   .clipShape(Circle())
                            }//HStack
                            .padding()
                          }//VStack
                      }//ZStack
                ZStack{
                    ScrollView(.vertical,showsIndicators: false){
                        VStack(){
                            
                            ForEach(observedData.datas){i in
                                
                                TweetCellTopView(name: i.name, id: i.tagId, pic: i.pic, image: i.url, msg: i.msg)
                                
                                if i.pic != ""{
                                    TweetCellMiddleView(pic:i.pic).padding()
                                }
                                
                                
                                
                                TweetCellBottomView().padding()
                                
                                Divider()
                            }//Foreach
                        }//VStack
                            .padding(.bottom,15)
                        
                        
                        VStack{
                            Spacer()
                            HStack{
                                Spacer()
                                
                               
                            }.padding()
                        }//VStack
                        
                    }//ScrollView
                }//ZStack
            }//VStack
                .sheet(isPresented: $show){
                    
                    CreateTweetView(show: self.$show)
            }
        }
    }
    struct TweetView_Previews: PreviewProvider {
        static var previews: some View {
            TweetView()
        }
    }
    
    
    struct datatype:Identifiable {
        
        var id :String
        var name:String
        var msg:String
        var retweets:String
        var likes:String
        var pic:String
        var url:String
        var tagId:String
    }
    
    func postTweet(msg:String){
        
        let db = Firestore.firestore()
        
        db.collection("tweets").document().setData(["name":"Tapio","id":"@Tapio","msg":msg,"retweet":"1","likes":"4","pic":"","url":""]){
            (err) in
            
            if err != nil{
                print((err?.localizedDescription)!)
                
                return
            }
            print("success")
        }
    }
    
    class getData:ObservableObject{
        
        @Published var datas = [datatype]()
        
        init(){
            
            let db = Firestore.firestore()
            
            db.collection("tweets").addSnapshotListener{(snap,err) in
                
                if err != nil{
                    
                    print((err?.localizedDescription)!)
                    return
                    
                }
                
                for i in snap!.documentChanges{
                    
                    if i.type == .added{
                        
                        let id = i.document.documentID
                        let name = i.document.get("name") as! String
                        let msg = i.document.get("msg") as! String
                        let pic = i.document.get("pic") as! String
                        let url = i.document.get("url") as! String
                        let retweets = i.document.get("retweet") as! String
                        let likes = i.document.get("likes") as! String
                        let tagID = i.document.get("id") as! String
                        
                        DispatchQueue.main.async {
                            
                            self.datas.append(datatype(
                                id: id, name: name, msg: msg, retweets: retweets, likes: likes, pic: pic, url: url, tagId: tagID
                            ))
                        }
                    }
                }
                
            }
            
        }
    }
