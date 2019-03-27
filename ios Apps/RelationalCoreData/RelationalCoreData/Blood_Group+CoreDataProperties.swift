//
//  Blood_Group+CoreDataProperties.swift
//  RelationalCoreData
//
//  Created by sanchit on 01/03/19.
//  Copyright © 2019 com.sanchit. All rights reserved.
//
//

import Foundation
import CoreData


extension Blood_Group {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Blood_Group> {
        return NSFetchRequest<Blood_Group>(entityName: "Blood_Group")
    }

    @NSManaged public var type: String?
    @NSManaged public var user: NSSet?

}

// MARK: Generated accessors for user
extension Blood_Group {

    @objc(addUserObject:)
    @NSManaged public func addToUser(_ value: User)

    @objc(removeUserObject:)
    @NSManaged public func removeFromUser(_ value: User)

 

}
