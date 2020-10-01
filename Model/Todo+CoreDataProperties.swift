//
//  Todo+CoreDataProperties.swift
//  ToDo List
//
//  Created by Vinayak Sharma on 01/10/20.
//
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var title: String
    @NSManaged public var date: Date?

}

extension Todo : Identifiable {

}
