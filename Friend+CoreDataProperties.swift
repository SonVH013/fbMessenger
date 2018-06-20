//
//  Friend+CoreDataProperties.swift
//  fbMessenger
//
//  Created by GVN on 6/20/18.
//  Copyright © 2018 Son Vu. All rights reserved.
//
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var name: String?
    @NSManaged public var imageProfileName: String?
    @NSManaged public var messenges: NSSet?

}

// MARK: Generated accessors for messenges
extension Friend {

    @objc(addMessengesObject:)
    @NSManaged public func addToMessenges(_ value: Message)

    @objc(removeMessengesObject:)
    @NSManaged public func removeFromMessenges(_ value: Message)

    @objc(addMessenges:)
    @NSManaged public func addToMessenges(_ values: NSSet)

    @objc(removeMessenges:)
    @NSManaged public func removeFromMessenges(_ values: NSSet)

}
