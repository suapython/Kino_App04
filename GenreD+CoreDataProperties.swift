//
//  GenreD+CoreDataProperties.swift
//  Kino_App04
//
//  Created by jose francisco morales on 30/11/2020.
//
//

import Foundation
import CoreData


extension GenreD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GenreD> {
        return NSFetchRequest<GenreD>(entityName: "GenreD")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var genre: NSSet?
    
    public var nameW: String {return name ?? "N/A"}
     

}

// MARK: Generated accessors for genre
extension GenreD {

    @objc(addGenreObject:)
    @NSManaged public func addToGenre(_ value: Film)

    @objc(removeGenreObject:)
    @NSManaged public func removeFromGenre(_ value: Film)

    @objc(addGenre:)
    @NSManaged public func addToGenre(_ values: NSSet)

    @objc(removeGenre:)
    @NSManaged public func removeFromGenre(_ values: NSSet)

}

extension GenreD : Identifiable {

}
