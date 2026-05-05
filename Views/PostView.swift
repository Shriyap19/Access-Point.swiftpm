//
//  Untitled.swift
//  Access Point
//
//  Created by Shriya Patel on 4/21/26.
//

import SwiftUI

struct PostView : View {
var username:String = ""
var title:String = ""
var text:String = ""
var numberofcoms:Int = 0
    var body: some View {
        HStack {
            Spacer().frame(maxWidth:70)
            VStack(alignment:.leading) {
                HStack {
                    Image(systemName: "person.circle").font(.system(size:40))
                    Text(username).font(Font.title2)
                    
                }
                        
                    VStack(alignment:.leading) {
                        Text(title).font(Font.title).bold()
                        Text(text).font(Font.title2)
                    }.foregroundStyle(Color.white).padding().frame(maxWidth:.infinity, alignment: .leading).background(RoundedRectangle(cornerRadius: 18).fill(.blue)
                    )
                            HStack {
                                Image(systemName: "bubble.right").font(.system(size:20))
                                Text("\(numberofcoms)").font(Font.title3).foregroundStyle(.gray)
                                
                            }.padding(.leading)
                            
                    
                
               
            
            }
            Spacer().frame(maxWidth:70)
        }
        
           
    }
}
