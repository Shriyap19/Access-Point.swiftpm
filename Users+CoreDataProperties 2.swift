//
//  Users+CoreDataProperties.swift
//  Access Point
//
//  Created by Shriya Patel on 9/1/26.
//
//

public import Foundation
public import CoreData


public typealias UsersCoreDataPropertiesSet = NSSet

extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var email: String?
    @NSManaged public var username: String?
    @NSManaged public var id: UUID?
    @NSManaged public var basicInfo: NSSet?
    @NSManaged public var basicinfo2: Jobpost?

}

// MARK: Generated accessors for basicInfo
extension Users {

    @objc(addBasicInfoObject:)
    @NSManaged public func addToBasicInfo(_ value: Forumpost)

    @objc(removeBasicInfoObject:)
    @NSManaged public func removeFromBasicInfo(_ value: Forumpost)

    @objc(addBasicInfo:)
    @NSManaged public func addToBasicInfo(_ values: NSSet)

    @objc(removeBasicInfo:)
    @NSManaged public func removeFromBasicInfo(_ values: NSSet)

}
