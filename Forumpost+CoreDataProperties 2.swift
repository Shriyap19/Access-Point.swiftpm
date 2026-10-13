//
//  Forumpost+CoreDataProperties.swift
//  Access Point
//
//  Created by Shriya Patel on 9/1/26.
//
//

public import Foundation
public import CoreData


public typealias ForumpostCoreDataPropertiesSet = NSSet

extension Forumpost {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Forumpost> {
        return NSFetchRequest<Forumpost>(entityName: "Forumpost")
    }

    @NSManaged public var text: String?
    @NSManaged public var title: String?
    @NSManaged public var id: UUID?
    @NSManaged public var users: Users?

}
