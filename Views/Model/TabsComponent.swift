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
            MapView()
                .tabItem {
                    Label("Map", systemImage: "map.fill")
                }
            BoardView()
                .tabItem {
                    Label("Board", systemImage: "message")
                    
                }
            ContributeView()
                .tabItem {
                    Label("Contribute", systemImage: "hand.raised")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
            
        }.tint(.blue).environment(\.horizontalSizeClass, .compact)

        
        
    }
}
