//
//  AccountSettingsView.swift
//  Access Point
//
//  Created by Shriya Patel on 6/22/26.
//
import SwiftUI

struct AccountSettingsView: View {
    
    let user: UserProfile
    
    init(user: UserProfile) {
        self.user = user
        self._name = State(initialValue: user.name)
    }
    
    @State private var name:String
    @State private var email:String = "shriya@email.com"
    @State private var phone:String = "+1 234 567 890"
    @State private var organization:String="Accese point"
    

    var body: some View {
        NavigationStack{
            ScrollView {

                VStack(spacing: 20) {

                 

                    VStack(spacing: 16) {

                        Circle()
                            .fill(.blue.opacity(0.15))
                            .frame(width: 70, height: 70)
                            .overlay {
                                Text(name.split(separator: " ")
                                    .compactMap { $0.first }.prefix(2).map(String.init).joined())
                                    .font(.title.bold())
                                    .foregroundStyle(.blue)
                            }

                        Text(name)
                            .font(.title3.bold())
                        
                        NavigationLink {
                            EditProfileView(
                                name: $name,
                                email: $email,
                                phone: $phone,
                                organization: $organization
                            )
                        } label: {
                            Text("Edit Profile")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundStyle(.blue)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(Color.blue.opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                    }
                    .padding()


                    SettingsRow(
                        icon: "envelope",
                        title: "Email",
                        value: email
                    )

                    SettingsRow(
                        icon: "phone",
                        title: "Phone Number",
                        value: phone
                    )

                    SettingsRow(
                        icon: "building.2",
                        title: "Organization",
                        value: organization
                    )
                }
            }
        }
       
    }
}

