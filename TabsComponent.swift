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

            Text("Board ")
                .tabItem {
                    Label("Board", systemImage: "person")
                }
            Text("Contribute ")
                .tabItem {
                    Label("Contribute", systemImage: "hand")
                }
            Text("Settings ")
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
            
        }.tint(.blue)

        
        
    }
}
