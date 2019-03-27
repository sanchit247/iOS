//
//  User+CoreDataProperties.swift
//  RelationalCoreData
//
//  Created by sanchit on 01/03/19.
//  Copyright © 2019 com.sanchit. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var age: String?
    @NSManaged public var password: String?
    @NSManaged public var userName: String?
    @NSManaged public var bloodGroup: Blood_Group?
    @NSManaged public var tasks: NSSet?

}

// MARK: Generated accessors for tasks
extension User {

    @objc(addTasksObject:)
    @NSManaged public func addToTasks(_ value: Task)

    @objc(removeTasksObject:)
    @NSManaged public func removeFromTasks(_ value: Task)

   

}
