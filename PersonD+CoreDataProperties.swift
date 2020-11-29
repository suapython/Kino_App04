//
//  PersonD+CoreDataProperties.swift
//  Kino_App04
//
//  Created by jose francisco morales on 30/11/2020.
//
//

import Foundation
import CoreData


extension PersonD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonD> {
        return NSFetchRequest<PersonD>(entityName: "PersonD")
    }

    @NSManaged public var name: String?
    @NSManaged public var personId: Int32
    @NSManaged public var popularity: Float
    @NSManaged public var cast: NSSet?
    @NSManaged public var director: NSSet?

}

// MARK: Generated accessors for cast
extension PersonD {

    @objc(addCastObject:)
    @NSManaged public func addToCast(_ value: Film)

    @objc(removeCastObject:)
    @NSManaged public func removeFromCast(_ value: Film)

    @objc(addCast:)
    @NSManaged public func addToCast(_ values: NSSet)

    @objc(removeCast:)
    @NSManaged public func removeFromCast(_ values: NSSet)

}

// MARK: Generated accessors for director
extension PersonD {

    @objc(addDirectorObject:)
    @NSManaged public func addToDirector(_ value: Film)

    @objc(removeDirectorObject:)
    @NSManaged public func removeFromDirector(_ value: Film)

    @objc(addDirector:)
    @NSManaged public func addToDirector(_ values: NSSet)

    @objc(removeDirector:)
    @NSManaged public func removeFromDirector(_ values: NSSet)

}

extension PersonD : Identifiable {

}
