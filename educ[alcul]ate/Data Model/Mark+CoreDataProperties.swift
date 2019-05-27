//
//  Mark+CoreDataProperties.swift
//  educ[alcul]ate
//
//  Created by Jordan Belinsky on 2019-05-23.
//  Copyright © 2019 Jordan Belinsky. All rights reserved.
//
//

import Foundation
import CoreData


extension Mark {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mark> {
        return NSFetchRequest<Mark>(entityName: "Mark")
    }

    @NSManaged public var name: String?
    @NSManaged public var value: Double
    @NSManaged public var parentClass: Class?

}
