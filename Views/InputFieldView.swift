//
//  InputFieldView.swift
//  Access Point
//
//  Created by Shriya Patel on 6/16/26.
//
import SwiftUI
struct InputFieldView: View {
    let title:String
    let icon:String
    let placeholder: String
    @Binding var text:String
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline)
            
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.gray)
                    .padding(.leading, 5)
                TextField(placeholder, text: $text)
                    
            }.padding()
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 18))
                .overlay(
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
        }
    }
    
    
}
