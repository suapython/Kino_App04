//
//  KeywordsD+CoreDataProperties.swift
//  Kino_App04
//
//  Created by jose francisco morales on 30/11/2020.
//
//

import Foundation
import CoreData


extension KeywordsD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<KeywordsD> {
        return NSFetchRequest<KeywordsD>(entityName: "KeywordsD")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var keywords: NSSet?

}

// MARK: Generated accessors for keywords
extension KeywordsD {

    @objc(addKeywordsObject:)
    @NSManaged public func addToKeywords(_ value: Film)

    @objc(removeKeywordsObject:)
    @NSManaged public func removeFromKeywords(_ value: Film)

    @objc(addKeywords:)
    @NSManaged public func addToKeywords(_ values: NSSet)

    @objc(removeKeywords:)
    @NSManaged public func removeFromKeywords(_ values: NSSet)

}

extension KeywordsD : Identifiable {

}
