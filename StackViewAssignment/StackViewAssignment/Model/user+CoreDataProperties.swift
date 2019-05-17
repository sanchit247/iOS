//
//  User+CoreDataProperties.swift
//  StackViewAssignment
//
//  Created by sanchit on 02/05/19.
//  Copyright © 2019 com.sanchit. All rights reserved.
//
//
import Foundation
import CoreData


extension User {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }
    
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    
}
