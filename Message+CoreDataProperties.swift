//
//  Message+CoreDataProperties.swift
//  fbMessenger
//
//  Created by GVN on 6/20/18.
//  Copyright © 2018 Son Vu. All rights reserved.
//
//

import Foundation
import CoreData


extension Message {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Message> {
        return NSFetchRequest<Message>(entityName: "Message")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var mess: String?
    @NSManaged public var friend: Friend?

}
