//
//  SettingsRow.swift
//  Access Point
//
//  Created by Shriya Patel on 6/22/26.
//
import SwiftUI

struct SettingsRow: View {

    let icon: String
    let title: String
    let value: String

    var body: some View {

        HStack {

            Image(systemName: icon)
                .foregroundStyle(.blue)

            Text(title)

            Spacer()

            Text(value)
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
