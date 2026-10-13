//
//  EditProfileView.swift
//  Access Point
//
//  Created by Shriya Patel on 6/30/26.
//
//
//  EditProfileView.swift
//  Access Point
//
import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var name: String
    @Binding var email: String
    @Binding var phone: String
    @Binding var organization: String

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {

                VStack(alignment: .leading, spacing: 4) {
                    Text("Edit Profile").font(.largeTitle).fontWeight(.bold)
                    Text("Update your account information").font(.subheadline).foregroundStyle(.secondary)
                }.frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal, 20).padding(.top, 8)

                editRow(icon: "person.fill", title: "Name", text: $name)
                editRow(icon: "envelope.fill", title: "Email", text: $email)
                editRow(icon: "phone.fill", title: "Phone Number", text: $phone)
                editRow(icon: "building.2.fill", title: "Organization", text: $organization)

                Button {
                    dismiss()
                } label: {
                    Text("Save Changes")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .background(Color.blue.gradient)
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                }
                .padding(.horizontal, 20)
                .padding(.top, 8)
            }
            .padding(.vertical, 20)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "chevron.left").fontWeight(.semibold)
                        Text("Settings")
                    }
                    .foregroundStyle(.blue)
                }
            }
        }
    }

    @ViewBuilder
    func editRow(icon: String, title: String, text: Binding<String>) -> some View {
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
                TextField(title, text: text)
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
}
