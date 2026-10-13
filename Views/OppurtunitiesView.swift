//
//  OppurtunitiesView.swift
//  Access Point
//
//  Created by Shriya Patel on 4/14/26.
//
import SwiftUI
import Foundation

struct OppurtunitiesView: View {
    @AppStorage("jobs")
    private var savedJobs: String = "[]"
    var jobs: [Job] {
        let data = Data(savedJobs.utf8)
        return (try? JSONDecoder().decode([Job].self, from: data)) ?? []
    }
    @State private var selection = 0
    var body: some View {
        ScrollView{
            VStack(spacing:16) {
                
            
                    VStack(alignment: .leading) {
                        Text("Recomended for you:").font(.largeTitle).fontWeight(.bold).foregroundStyle(.primary)
                    }.frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal, 20).padding(.top,8)
                Button{
                    UserDefaults.standard.removeObject(forKey: "jobs")
                    
                } label: {
                    HStack{
                    Image(systemName: "trashcan")
                        
                        Text("Clear Test Jobs") .fontWeight(.semibold)
                    }.foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
            }
                    
//                Button("Clear Test Jobs") {
//                    savedJobs = "[]"
//                }
                
                ForEach(jobs) { job in
                    JobPostView(job: job)
                }
            }
        }
        
        
        
        }
        
    }

