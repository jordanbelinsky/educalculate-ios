//
//  Class+CoreDataProperties.swift
//  educ[alcul]ate
//
//  Created by Jordan Belinsky on 2019-05-23.
//  Copyright © 2019 Jordan Belinsky. All rights reserved.
//
//

import Foundation
import CoreData


extension Class {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Class> {
        return NSFetchRequest<Class>(entityName: "Class")
    }

    @NSManaged public var name: String?
    @NSManaged public var overall: Double
    @NSManaged public var rawMarks: NSOrderedSet?

}

// MARK: Generated accessors for rawMarks
extension Class {

    @objc(insertObject:inRawMarksAtIndex:)
    @NSManaged public func insertIntoRawMarks(_ value: Mark, at idx: Int)

    @objc(removeObjectFromRawMarksAtIndex:)
    @NSManaged public func removeFromRawMarks(at idx: Int)

    @objc(insertRawMarks:atIndexes:)
    @NSManaged public func insertIntoRawMarks(_ values: [Mark], at indexes: NSIndexSet)

    @objc(removeRawMarksAtIndexes:)
    @NSManaged public func removeFromRawMarks(at indexes: NSIndexSet)

    @objc(replaceObjectInRawMarksAtIndex:withObject:)
    @NSManaged public func replaceRawMarks(at idx: Int, with value: Mark)

    @objc(replaceRawMarksAtIndexes:withRawMarks:)
    @NSManaged public func replaceRawMarks(at indexes: NSIndexSet, with values: [Mark])

    @objc(addRawMarksObject:)
    @NSManaged public func addToRawMarks(_ value: Mark)

    @objc(removeRawMarksObject:)
    @NSManaged public func removeFromRawMarks(_ value: Mark)

    @objc(addRawMarks:)
    @NSManaged public func addToRawMarks(_ values: NSOrderedSet)

    @objc(removeRawMarks:)
    @NSManaged public func removeFromRawMarks(_ values: NSOrderedSet)

}
