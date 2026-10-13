//
//  PermissionsSettingsView.swift
//  Access Point
//
//  Created by Shriya Patel on 6/22/26.
//
import SwiftUI

struct PermissionsSettingsView: View {

    @State private var notifications = true
    @State private var location = true
    @State private var camera = true
    @State private var photos = true

    var body: some View {

        List {

            Toggle("Notifications", isOn: $notifications)

            Toggle("Location Services", isOn: $location)

            Toggle("Camera Access", isOn: $camera)

            Toggle("Photo Library", isOn: $photos)
        }
        .scrollContentBackground(.hidden)
    }
}
