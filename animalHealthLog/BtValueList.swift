//
//  BtValueList.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/04/14.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI
import CoreData


struct BunValueList: View {
    var btList:BtList
    
    var body: some View {
        VStack{
            if btList.bun as? String != nil{//optinal化してnilじゃなければアンラップ
                    Text(btList.bun as! String)
            }
            else{
                Text("nil")
            }
        }
    }
}



struct CreValueList:View {
    var btList:BtList
    
    var body: some View{
        VStack{
            if btList.cre as? String != nil{
                Text(btList.cre as! String)
                           }
                else{
                Text("nil")
            }
        }
    }
}

struct AltValueList:View {
    var btList:BtList
    
    var body: some View{
        VStack{
            if btList.alt as? String != nil{
        Text(btList.alt as! String)
            }
            else{
                Text("nil")
            }
        }
    }
}

struct AstValueList:View {
    var btList:BtList
    
    var body: some View{
        VStack{
            if btList.ast as? String != nil{
        Text(btList.ast as! String)
            }
            else{
                Text("nil")
            }
        }
    }
}

struct AlpValueList:View {
    var btList:BtList
    
    var body: some View{
        VStack{
            if btList.alp as? String != nil{
        Text(btList.alp as! String)
            }
            else{
                Text("nil")
            }
        }
    }
}

struct GgtValueList:View {
    var btList:BtList
    
    var body: some View{
        VStack{
            if btList.ggt as? String != nil{
        Text(btList.ggt as! String)
            }
            else{
                Text("nil")
            }
        }
    }
}

struct TbilValueList:View {
    var btList:BtList
    
    var body: some View{
        VStack{
            if btList.tbil as? String != nil{
        Text(btList.tbil as! String)
            }
            else{
                Text("nil")
            }
        }
    }
}

struct NhValueList:View {
    var btList:BtList
    
    var body: some View{
        VStack{
            if btList.nh as? String != nil{
        Text(btList.nh as! String)
            }
            else{
                Text("nil")
            }
        }
    }
}

struct TpValueList:View {
    var btList:BtList
    
    var body: some View{
        VStack{
            if btList.tp as? String != nil{
        Text(btList.tp as! String)
            }
            else{
                Text("nil")
            }
        }
    }
}

struct AlbValueList:View {
    var btList:BtList
    
    var body: some View{
        VStack{
            if btList.alb as? String != nil{
        Text(btList.alb as! String)
            }
            else{
                Text("nil")
            }
        }
    }
}

struct GlucoseValueList:View {
    var btList:BtList
    
    var body: some View{
        VStack{
            if btList.glu as? String != nil{
        Text(btList.glu as! String)
            }
            else{
                Text("nil")
            }
        }
    }
}

struct NaValueList:View {
    var btList:BtList
    
    var body: some View{
        VStack{
            if btList.na as? String != nil{
        Text(btList.na as! String)
            }
            else{
                Text("nil")
            }
        }
    }
}

struct KValueList:View {
    var btList:BtList
    
    var body: some View{
        VStack{
            if btList.k as? String != nil{
        Text(btList.k as! String)
            }
            else{
                Text("nil")
            }
        }
    }
}

struct ClValueList:View {
    var btList:BtList
    
    var body: some View{
        VStack{
            if btList.cl as? String != nil{
        Text(btList.cl as! String)
            }
            else{
                Text("nil")
            }
        }
    }
}

struct CaValueList:View {
    var btList:BtList
    
    var body: some View{
        VStack{
            if btList.ca as? String != nil{
        Text(btList.ca as! String)
            }
            else{
                Text("nil")
            }
        }
    }
}


struct IpValueList:View {
    var btList:BtList
    
    var body: some View{
        VStack{
        if btList.ip as? String != nil{
        Text(btList.ip as! String)
    }
        else{
            Text("nil")
        }
    }
    }
}

struct MgValueList:View {
    var btList:BtList
    
    var body: some View{
        VStack{
            if btList.mg as? String != nil{
        Text(btList.mg as! String)
            }
            else{
                Text("nil")
            }
        }
    }
}

struct AmyValueList:View {
    var btList:BtList
    
    var body: some View{
        VStack{
            if btList.amy as? String != nil{
        Text(btList.amy as! String)
            }
            else{
                Text("nil")
            }
        }
    }
}

struct LipValueList:View {
    var btList:BtList
    
    var body: some View{
        VStack{
            if btList.lip as? String != nil{
        Text(btList.lip as! String)
            }
            else{
                Text("nil")
            }
        }
    }
}

struct TgValueList:View {
    var btList:BtList
    
    var body: some View{
        VStack{
            if btList.tg as? String != nil{
        Text(btList.tg as! String)
            }
            else{
                Text("nil")
            }
        }
    }
}

struct TchoValueList:View {
    var btList:BtList
    
    var body: some View{
        VStack{
            if btList.tcho as? String != nil{
        Text(btList.tcho as! String)
            }
            else{
                Text("nil")
            }
        }
    }
}

struct CrpValueList:View {
    var btList:BtList
    
    var body: some View{
        VStack{
            if btList.crp as? String != nil{
        Text(btList.crp as! String)
            }
            else{
                Text("nil")
            }
        }
    }
}

struct CpkValueList:View {
    var btList:BtList
    
    var body: some View{
        VStack{
            if btList.cpk as? String != nil{
        Text(btList.cpk as! String)
            }
            else{
                Text("nil")
            }
        }
    }
}
//struct BtValueList: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct BtValueList_Previews: PreviewProvider {
//    static var previews: some View {
//        BtValueList()
//    }
//}
