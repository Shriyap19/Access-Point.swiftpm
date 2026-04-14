//
//  Tabs.swift
//  Access Point
//
//  Created by Shriya Patel on 4/10/26.
//

import SwiftUI


struct TabsComponent: View {
    
    
    
    var body: some View {
        TabView {
            Text("Map")
                .tabItem {
                    Label("Map", systemImage: "map.fill")
                }
            BoardView()
                .tabItem {
                    Label("Board", systemImage: "message")
                    
                }
            Text("Contribute ")
                .tabItem {
                    Label("Contribute", systemImage: "hand.raised")
                }
            Text("Settings ")
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
            
        }.tint(.blue).environment(\.horizontalSizeClass, .compact)

        
        
    }
}
