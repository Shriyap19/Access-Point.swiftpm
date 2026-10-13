//
//  Jobpost+CoreDataProperties.swift
//  Access Point
//
//  Created by Shriya Patel on 9/1/26.
//
//

public import Foundation
public import CoreData


public typealias JobpostCoreDataPropertiesSet = NSSet

extension Jobpost {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Jobpost> {
        return NSFetchRequest<Jobpost>(entityName: "Jobpost")
    }

    @NSManaged public var heading: String?
    @NSManaged public var info: String?
    @NSManaged public var id: UUID?
    @NSManaged public var users2: Users?

}
