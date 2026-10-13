//
//  ForumPost.swift
//  Access Point
//
//  Created by Shriya Patel on 9/22/26.
//

import Foundation
struct ForumPost: Identifiable, Codable {
    var id: UUID = UUID()
    var username: String
    var title: String
    var text: String
    var numberofcoms: Int = 0
    var date: Date = Date()
    //basicly coredata database w out coredata
    
}
