//
//  SocialView.swift
//  Access Point
//
//  Created by Shriya Patel on 4/14/26.
//
import SwiftUI

struct SocialView: View {
    @State private var selection = 0
    var body: some View {
        VStack(alignment:.leading, spacing: 29) {
            PostView(username: "Shriya", title: "food", text: "Cookies and creme cake",numberofcoms: 0)
            PostView(username: "Sina", title: "tacos", text: "trick, nachos are better dsfdsdfsfsdfsdfsfds ", numberofcoms: 2)
        }
    }
}
