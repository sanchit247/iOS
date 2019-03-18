//
//  BloodGroup+CoreDataProperties.swift
//  CoreDataTest
//
//  Created by sanchit on 12/03/19.
//  Copyright © 2019 com.sanchit. All rights reserved.
//
//

import Foundation
import CoreData


extension BloodGroup {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BloodGroup> {
        return NSFetchRequest<BloodGroup>(entityName: "BloodGroup")
    }

    @NSManaged public var bloodGroup: String?
    @NSManaged public var person: NSSet?

}

// MARK: Generated accessors for person
extension BloodGroup {

    @objc(addPersonObject:)
    @NSManaged public func addToPerson(_ value: Person)

    @objc(removePersonObject:)
    @NSManaged public func removeFromPerson(_ value: Person)

    @objc(addPerson:)
    @NSManaged public func addToPerson(_ values: NSSet)

    @objc(removePerson:)
    @NSManaged public func removeFromPerson(_ values: NSSet)

}
