//
//  PostInfo.swift
//  Access Point
//
//  Created by Shriya Patel on 6/9/26.
//
import SwiftUI
import CoreData

struct PostInfoView: View {
    @State private var title: String = ""
    @State private var description: String = ""
    @AppStorage("forumPosts")
    private var savedPosts: String = "[]"
    @Environment(\.dismiss) private var dismiss
    //creates empty list for the posts to be accessed
//    @Environment(\.managedObjectContext) private var viewContext
    var body: some View {
        ScrollView{
            VStack(alignment:.leading, spacing:22){
                VStack(spacing:10){
                    Text("Create Post").font(Font.system(size: 38, weight: .bold, design: .rounded))
                    Text("Fill in the details below to create your post").font(.subheadline).foregroundStyle(.secondary)
                }.frame(maxWidth:.infinity)
                
                InputFieldView(title: "Title", icon: "arrow.up", placeholder: "e.g.:New Wheel Ramp", text: $title)
                
                
                
                VStack(alignment:.leading,spacing: 8 ){
                    Text("Description").font(.headline)
                    TextEditor(text: $description) .scrollContentBackground(.hidden) .frame(height: 160) .padding(10) .background(Color(.systemGray6)) .clipShape(RoundedRectangle(cornerRadius: 18)) .overlay( RoundedRectangle(cornerRadius: 18) .stroke(Color.gray.opacity(0.2), lineWidth: 1) )
                }
                
                Button {
                    savePost()
                    dismiss()
//                     let newforumpost = Forumpost(context: viewContext)
//                    newforumpost.title = title
//                    newforumpost.text = description
//                    newforumpost.id = UUID()
//                    newforumpost.users = 
//                    
//                    do {
//                        try viewContext.save()
//                        print("action completed")
//                    } catch{
//                        print("something went wrong with the action")
//                    }
                     
                } label: {
                        HStack{
                        Image(systemName: "paperplane")
                            
                            Text("Post Your Thoughts!").fontWeight(.semibold)
                        }.foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                }
            }.padding(.horizontal, 40).padding(.vertical, 30).frame(maxWidth:700).frame(maxWidth:.infinity)
        }
        
    }
    private func savePost() {
        let data = Data(savedPosts.utf8)
        
        var posts = (try? JSONDecoder().decode([ForumPost].self, from: data)) ?? []
        
        let newPost = ForumPost(
            username: "Shriya",
            title: title,
            text: description
        )
        posts.insert(newPost, at: 0)

            if let encoded = try? JSONEncoder().encode(posts),
               let jsonString = String(
                   data: encoded,
                   encoding: .utf8
               ) {
                
                savedPosts = jsonString
                
            }
    }
}
