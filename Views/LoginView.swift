//
//  LoginView.swift
//  Access Point
//
//  Created by Shriya Patel on 6/30/26.
//
//
//  LoginView.swift
//  Access Point
//
//  Created by Shriya Patel on 6/30/26.
//
//

import SwiftUI


struct LoginView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
@State private var organization: String = ""
    @State private var notifications: Bool = true
    @State private var location: Bool = true
    @State private var camera: Bool = true
    @State private var photos: Bool = true
    @State private var isLoggedIn: Bool = false

    var body: some View {
        if isLoggedIn {
            ContentView()
        } else {
            ScrollView {
                VStack(spacing: 16) {

                    VStack(spacing: 6) {
                        Circle()
                            .fill(.blue.opacity(0.15))
                            .frame(width: 70, height: 70)
                            .overlay {
                                Image(systemName: "figure.roll")
                                    .font(.system(size: 30))
                                    .foregroundStyle(.blue)
                            }
                        Text("Access Point")
                            .font(.largeTitle.bold())
                        Text("Sign in to get started")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 40)
                    .padding(.bottom, 8)

                    sectionHeader("Account Info")

                    loginRow(icon: "person.fill", title: "Full Name", placeholder: "Shriya Patel", text: $name)
                    loginRow(icon: "envelope.fill", title: "Email", placeholder: "you@email.com", text: $email)
                    loginRow(icon: "phone.fill", title: "Phone Number", placeholder: "(555)-555-5555", text: $phone)
                    loginRow(icon: "building.2.fill", title: "Organization", placeholder: "Access Point", text: $organization)

                    sectionHeader("Permissions")
                        .padding(.top, 8)

                    permissionRow(icon: "bell.fill", title: "Notifications", isOn: $notifications)
                    permissionRow(icon: "location.fill", title: "Location Services", isOn: $location)
                    permissionRow(icon: "camera.fill", title: "Camera Access", isOn: $camera)
                    permissionRow(icon: "photo.fill", title: "Photo Library", isOn: $photos)

                    Button {
                        isLoggedIn = true
                    } label: {
                        Text("Sign In")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 52)
                            .background(Color.blue.gradient)
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 8)
                    .padding(.bottom, 32)
                }
            }
        }
    }

    @ViewBuilder
    func sectionHeader(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 13, weight: .semibold))
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
    }

    @ViewBuilder
    func loginRow(icon: String, title: String, placeholder: String, text: Binding<String>) -> some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 18))
                .foregroundStyle(.blue)
                .padding(12)
                .background(Color.blue.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(.secondary)
                TextField(placeholder, text: text)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.primary)
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .shadow(color: .black.opacity(0.06), radius: 10, x: 0, y: 3)
        .padding(.horizontal, 16)
    }

    @ViewBuilder
    func permissionRow(icon: String, title: String, isOn: Binding<Bool>) -> some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 18))
                .foregroundStyle(.blue)
                .padding(12)
                .background(Color.blue.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 12))

            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.primary)

            Spacer()

            Toggle("", isOn: isOn)
                .labelsHidden()
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .shadow(color: .black.opacity(0.06), radius: 10, x: 0, y: 3)
        .padding(.horizontal, 16)
    }
}

