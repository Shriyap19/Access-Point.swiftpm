//
//  ContributeView.swift
//  Access Point
//
//  Created by Shriya Patel on 6/2/26.
//
import SwiftUI
enum NavigationDestinations: String, CaseIterable, Hashable {
    case JobInfoView
    case PostInfoView
    
}
struct ContributeView: View {
    let routes = NavigationDestinations.allCases
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Contribute").font(.largeTitle).fontWeight(.bold)
                    Text("Help out your community").font(.subheadline).foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.top, 29)//padding pushing text down at the top a bit

                NavigationLink(value: NavigationDestinations.PostInfoView) {
                    ButtonsView(image: "plus.bubble.fill", title: "Want to create a post?", description: "Click Create to share your thoughts.")
                }
                NavigationLink(value: NavigationDestinations.JobInfoView) {
                    ButtonsView(image: "briefcase.fill", title: "Know about a Job Oppurtunity?", description: "Click Create below to share.")
                }
            }
            .padding(.horizontal, 16)
            .frame(maxHeight: .infinity, alignment: .top) // makes it so Vstack stakes up whole screen
            .ignoresSafeArea(edges: .top) //#1
            .navigationDestination(for: NavigationDestinations.self) { route in
                switch route {
                case .JobInfoView:
                    JobInfoView()
                case .PostInfoView:
                    PostInfoView()
                }
            }
        }
        .toolbar(.hidden, for: .navigationBar)//#2 , #1 and #2 make it so there is space at the top for the vstack to fill
    }
    }
