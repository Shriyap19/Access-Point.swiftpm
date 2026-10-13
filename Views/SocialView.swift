//
//  SocialView.swift
//  Access Point
//
//  Created by Shriya Patel on 4/14/26.
//
import SwiftUI


struct SocialView: View {
    @State private var selection = 0
    @AppStorage("forumPosts")
    private var savedPosts: String = "[]"
    private var posts: [ForumPost] {
        guard let data = savedPosts.data(using: .utf8) else {
            return[]
        }
        return (try? JSONDecoder().decode([ForumPost].self, from: data)) ?? [] // so social view can accese it
    }
    //makes it so same as ppostinfo view
    //@FetchRequest(sortDescriptors:[]) var posts: FetchedResults<Forumpost>
    var body: some View {
        ScrollView {
            VStack(alignment:.leading, spacing: 29) {
                Text("Board:").font(.largeTitle).fontWeight(.bold).padding(.horizontal, 20)
                ForEach(posts) { post in
                PostView(
                    username: post.username,
                    title: post.title,
                    text: post.text,
                    numberofcoms: post.numberofcoms
                )// removes examples posts and beging prepping for new actual ones
                }
//                ForEach (posts,id: \.self){ post in
//                        PostView(username: "Anish", title: post.title!, text: post.text!, numberofcoms: 0)
//                }
            }.padding(.top, 10)

        }
    }
}
