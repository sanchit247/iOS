//
//  Task+CoreDataProperties.swift
//  RelationalCoreData
//
//  Created by sanchit on 01/03/19.
//  Copyright © 2019 com.sanchit. All rights reserved.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var title: String?
    @NSManaged public var user: User?

}
