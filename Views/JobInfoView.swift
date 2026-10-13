//
//  JobInfoView.swift
//  Access Point
//
//  Created by Shriya Patel on 6/9/26.
//

import SwiftUI
import Foundation

struct JobInfoView:View {
    @State private var companyname:String = ""
    @State private var jobtitle:String = ""
    @State private var location:String = ""
    @State private var salary:String = ""
    @State private var description:String = ""
    @State private var type:String = ""
    @AppStorage("jobs")
    private var savedJobs: String = "[]"
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 22) {
                VStack(spacing:10){
                    
                    Text("Create Job").font(Font.system(size: 38, weight: .bold, design: .rounded))
                    Text("Fill in the details to post a new job.").font(.subheadline).foregroundStyle(.secondary)
                    
                    
                }.frame(maxWidth:.infinity)
                InputFieldView(
                    title: "Company Name",icon: "building.2",placeholder: "e.g. Acme Inc.",text: $companyname
                )
                InputFieldView(
                    title: "Job Title", icon: "text.justify", placeholder: "e.g. Software Engineer", text: $jobtitle
                )
                InputFieldView (
                    title: "Salary", icon: "dollarsign", placeholder: "e.g.80,000-100,000", text: $salary
                )
                InputFieldView (
                    title: "Location", icon: "map", placeholder: "e.g.Earth", text: $location
                )
                InputFieldView (
                    title: "Type", icon: "list.bullet", placeholder: "e.g.Fulltime", text: $type
                )
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Job Description").font(.headline)
                    TextEditor(text: $description) .scrollContentBackground(.hidden) .frame(height: 160) .padding(10) .background(Color(.systemGray6)) .clipShape(RoundedRectangle(cornerRadius: 18)) .overlay( RoundedRectangle(cornerRadius: 18) .stroke(Color.gray.opacity(0.2), lineWidth: 1) )
                    
                }
                
                Button {
                    saveJob()
                    dismiss()
                    
                } label: {
                    VStack(alignment: .leading) {
                        Text("Recomended for you:")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.primary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .padding(.top,8)
                    
                    Button {
                        UserDefaults.standard.removeObject(forKey: "jobs")
                    } label: {
                        HStack {
                            Image(systemName: "trashcan")
                            Text("Clear Test Jobs")
                                .fontWeight(.semibold)
                        }
                    }
                    
                    
                }.padding(.horizontal, 40).padding(.vertical, 30).frame(maxWidth:700).frame(maxWidth:.infinity)
                
                
            }
            
        }
        
       
    }
    
     private func saveJob() {
        let data = Data(savedJobs.utf8)
        var jobs = (try? JSONDecoder().decode( [Job].self, from: data)) ?? []
        let newJob = Job(
            companyName: companyname, jobTitle: jobtitle, salary: salary, location: location, type: type, description: description
        )
        jobs.insert(newJob, at: 0)
        do {
            let encoded = try JSONEncoder().encode(jobs)
            if let jsonString = String(data: encoded, encoding: .utf8) {
                savedJobs = jsonString
            }
        } catch {
            print("Failed to save job: \(error)")
        }
        
        
    }
    
}
