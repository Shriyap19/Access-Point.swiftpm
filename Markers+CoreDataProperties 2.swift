//
//  Markers+CoreDataProperties.swift
//  Access Point
//
//  Created by Shriya Patel on 9/1/26.
//
//

public import Foundation
public import CoreData


public typealias MarkersCoreDataPropertiesSet = NSSet

extension Markers {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Markers> {
        return NSFetchRequest<Markers>(entityName: "Markers")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var latitude: Float
    @NSManaged public var longitude: Float
    @NSManaged public var name: String?

}
