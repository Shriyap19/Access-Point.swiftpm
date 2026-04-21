//
//  Untitled.swift
//  Access Point
//
//  Created by Shriya Patel on 4/21/26.
//

import SwiftUI

struct PostView : View {
    var body: some View {
        VStack(alignment:.leading) {
            HStack {
                Image(systemName: "person.circle").font(.system(size:40))
                Text("Winner143").font(Font.title2)
            }
                    VStack(alignment:.leading){
                VStack(alignment:.leading) {
                    Text("Alts to wheelchairs?").font(Font.title).bold()
                    Text("Wheelchairs are too slow are their any faster cheap alternitaves").font(Font.title2)
                }.foregroundStyle(Color.white).padding().background(RoundedRectangle(cornerRadius: 18).fill(.blue))
                        HStack {
                            Image(systemName: "bubble.right").font(.system(size:20))
                            Text("12").font(Font.title3).foregroundStyle(.gray)
                            
                        }.padding(.leading)
                        
                
            }
           
                        
                    }
           
        
        
    }
}
