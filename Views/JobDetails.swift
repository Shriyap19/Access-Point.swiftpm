//
//  JobDetails.swift
//  Access Point
//
//  Created by Shriya Patel on 9/29/26.
//

import SwiftUI

struct JobDetailsView: View {
    @Environment(\.dismiss) private var dismiss
    let job: Job
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(job.jobTitle).font(.system(size: 30, weight: .bold))
                        Text(job.companyName).font(.title3).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 14) {
                        
                        InfoRow(
                            icon: "map",
                            title: "Location",
                            value: job.location
                        )
                        InfoRow(
                            icon: "dollarsign",
                            title: "Salary",
                            value: job.salary
                        )
                        InfoRow(
                            icon: "clock",
                            title: "Type",
                            value: job.type
                        )
                    }
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("About the Job").font(.title2).fontWeight(.bold)
                        Text(job.description).font(.body).foregroundStyle(.secondary)
                    }
                }.padding(24)
            }
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 26))
                    .foregroundStyle(.secondary)
            }
            .padding(.top, 12)
            .padding(.trailing, 18)
        }
    }
}
struct InfoRow: View {

    let icon: String
    let title: String
    let value: String

    var body: some View {
        HStack(spacing: 14) {

            Image(systemName: icon)
                .font(.system(size: 18))
                .foregroundStyle(.blue)
                .frame(width: 25)

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Text(value)
                    .font(.subheadline)
                    .fontWeight(.medium)
            }

            Spacer()
        }
    }
}
