//
//  Buttons.swift
//  Access Point
//
//  Created by Shriya Patel on 6/2/26.
//
import SwiftUI
struct ButtonsView: View {
    @State private var isPressed = false
    var image:String = ""
    var title:String = ""
    var description:String = ""
    var body: some View{
        HStack{
            VStack(spacing: 20) {
                VStack(alignment:.leading) {
                    
                    HStack(spacing:16){
                        Image(systemName: image).font(.system(size: 28)).foregroundStyle(Color.blue).padding(12).background(Color.blue.opacity(0.1)).clipShape(RoundedRectangle(cornerRadius: 12))
                        VStack(alignment:.leading) {
                            
                            Text(title).font(.system(size: 16, weight: .semibold)).foregroundStyle(.primary).fixedSize(horizontal: false, vertical: true)
                            VStack(alignment:.leading, spacing: 8){
                                Text(description).font(.subheadline).foregroundStyle(.secondary).fixedSize(horizontal: false, vertical: true)
                               
                                Text("Create")
                                    .font(.subheadline).fontWeight(.semibold)
                                    .foregroundStyle(.blue)
                                    .scaleEffect(isPressed ? 0.95 : 1.0)
                                    .animation(.spring(duration: 0.2), value: isPressed)
                                    
                                
                            }
                            
                        }

                    }.padding(16).frame(maxWidth:.infinity, alignment: .leading).background(Color(.systemBackground)).clipShape(RoundedRectangle(cornerRadius: 18)).shadow(color: .black.opacity(0.06), radius: 12, x: 0, y: 4)
                    
                                        
                    
                    
                }

            }
            
            
            
            
       // Spacer().frame(maxWidth:59)
        }
    }
        
    
}


