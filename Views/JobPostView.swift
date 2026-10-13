//
//  JobPostView.swift
//  Access Point
//
//  Created by Shriya Patel on 5/5/26.
//
import SwiftUI

struct JobPostView:View{
    let job: Job
    @State private var showingDetails = false
    @State private var isPressed = false
    var body: some View{
            
            VStack(spacing: 20) {
                VStack(alignment:.leading) {
                    
                    HStack(spacing:40){
                        Image(systemName: "briefcase.fill").font(.system(size: 32)).foregroundStyle(.blue).padding(12).background(Color.blue.opacity(0.1).clipShape(RoundedRectangle(cornerRadius: 10)))
                        VStack(alignment:.leading) {
                            
                            Text(job.jobTitle).font(.system(size: 17, weight: .semibold,)).foregroundStyle(.primary)
                            HStack{
                                Text(job.companyName).font(.subheadline).foregroundStyle(.secondary)
                                Spacer()
                                Button(action: {
                                    showingDetails = true
                                }){
                                    Image(systemName: "checkmark.circle").font(.system(size: 28)).foregroundStyle(.blue)
                                        .scaleEffect(isPressed ? 0.8 : 1.0)
                                        .animation(.spring(), value: isPressed)
                                }.buttonStyle(PlainButtonStyle())
                                    .simultaneousGesture(
                                        DragGesture(minimumDistance: 0)
                                            .onChanged { _ in isPressed = true }
                                            .onEnded { _ in isPressed = false }
                                    )
                                
                            }
                            
                        }

                    }.padding(16).frame(maxWidth:.infinity, alignment: .leading).background(Color(.systemBackground)).clipShape(RoundedRectangle(cornerRadius: 18)).shadow(color: .black.opacity(0.06), radius: 10, x: 0, y: 3).padding(.horizontal, 16)
                                        
                    
                    
                }

            }.sheet(isPresented: $showingDetails) {
                JobDetailsView(job: job)
            }
            
            
            
            
        
        
    }
}
