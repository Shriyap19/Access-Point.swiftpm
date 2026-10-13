//
//  SettingsView.swift
//  Access Point
//
//  Created by Shriya Patel on 6/22/26.
//
import SwiftUI

struct SettingsView: View {

    @State private var selectedTab = 0
    
    @State private var currentUser = UserProfile(
           name: "Shriya Patel",
           email: "shriya@email.com"
       )

    var body: some View {

        VStack(spacing: 24) {

            VStack(alignment: .leading, spacing: 8) {

                Text("Settings")
                    .font(.system(size: 34, weight: .bold))

                Text("Manage your account, permissions, and preferences.")
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Picker("", selection: $selectedTab) {

                Text("Account").tag(0)
                Text("Permissions").tag(1)
                Text("About").tag(2)
            }
            .pickerStyle(.segmented)

            switch selectedTab {

            case 0:
                AccountSettingsView(user: currentUser)

            case 1:
                PermissionsSettingsView()

            default:
                AboutSettingsView()
            }

            Spacer()
        }
        .padding()
    }
}
