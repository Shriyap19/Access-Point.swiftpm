//
//  Job.swift
//  Access Point
//
//  Created by Shriya Patel on 9/29/26.
//

import Foundation

struct Job : Identifiable, Codable {
    var id = UUID()
    var companyName: String
    var jobTitle : String
    var salary: String
    var location: String
    var type: String
    var description: String
    
}
