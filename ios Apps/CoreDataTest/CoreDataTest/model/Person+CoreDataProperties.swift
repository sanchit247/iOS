//
//  Person+CoreDataProperties.swift
//  CoreDataTest
//
//  Created by sanchit on 12/03/19.
//  Copyright © 2019 com.sanchit. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var activeTask: String?
    @NSManaged public var bloodGroup: String?
    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var blood: BloodGroup?
    @NSManaged public var task: NSSet?

}

// MARK: Generated accessors for task
extension Person {

    @objc(addTaskObject:)
    @NSManaged public func addToTask(_ value: Task)

    @objc(removeTaskObject:)
    @NSManaged public func removeFromTask(_ value: Task)

    @objc(addTask:)
    @NSManaged public func addToTask(_ values: NSSet)

    @objc(removeTask:)
    @NSManaged public func removeFromTask(_ values: NSSet)

}
