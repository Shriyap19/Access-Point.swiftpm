//
//  Untitled.swift
//  Access Point
//
//  Created by Shriya Patel on 4/21/26.
//

import SwiftUI

struct PostView: View {
    var username: String = ""
    var title: String = ""
    var text: String = ""
    var numberofcoms: Int = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 10) {
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 36))
                    .foregroundStyle(.blue.opacity(0.8))
                VStack(alignment: .leading, spacing: 2) {
                    Text(username).font(.system(size: 15, weight: .semibold))
                    Text("2h ago").font(.caption).foregroundStyle(.secondary)
                }
            }

            VStack(alignment: .leading, spacing: 6) {
                Text(title).font(.system(size: 16, weight: .semibold))
                Text(text).font(.subheadline).foregroundStyle(.secondary)
            }
            .padding(14)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 16))

            HStack(spacing: 6) {
                Image(systemName: "bubble.right")
                    .font(.system(size: 14))
                Text("\(numberofcoms)")
                    .font(.subheadline)
            }
            .foregroundStyle(.secondary)
        }
        .padding(16)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 3)
        .padding(.horizontal, 16)
    }
}
