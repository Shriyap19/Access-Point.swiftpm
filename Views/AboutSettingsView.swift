//
//  AboutSettingsView.swift
//  Access Point
//
//  Created by Shriya Patel on 6/22/26.
//
import SwiftUI


struct AboutSettingsView: View {
    @State private var showLogin: Bool = false

    var body: some View {

        List {

            Section("Application") {

                Label("Version 1.0.0",
                      systemImage: "iphone")

                Label("Build 100",
                      systemImage: "hammer")
            }

            Section("Support") {

                Button("Contact Support") {

                }

                Button("Report a Bug") {

                }
            }

            Section("Account") {

                Button("Sign Out") {
                    showLogin = true

                }.fullScreenCover(isPresented: $showLogin) {
                    LoginView()
                }

                Button(role: .destructive) {

                } label: {
                    Text("Delete Account")
                }
            }
        }
        .scrollContentBackground(.hidden)
    }
}
