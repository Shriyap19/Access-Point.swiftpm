//
//  Board.swift
//  Access Point
//
//  Created by Shriya Patel on 4/14/26.
//

import SwiftUI

struct BoardView: View {
    @State private var selection = 0
    var body: some View {
        NavigationStack {
            VStack {
                if selection == 0 {
                    SocialView()
                } else {
                    OppurtunitiesView()
                }
            }
            .toolbar {
                // makes it so segmented control acts as a tool to the page instead of a component
                ToolbarItem(placement: .principal) {
                    Picker("Options", selection: $selection) {
                               Text("Social").tag(0)
                               Text("Oppurtunites").tag(1)
                           }
                    .pickerStyle(SegmentedPickerStyle()).frame(width: 300)

                    
                }
            }.navigationBarTitleDisplayMode(.inline)
        }
    }
}
