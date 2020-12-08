//
//  User+CoreDataProperties.swift
//  Kino_App04
//
//  Created by jose francisco morales on 05/12/2020.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var category: String?
    @NSManaged public var image: String?
    @NSManaged public var kino: [Float]?
    @NSManaged public var name: String?
    @NSManaged public var topTen: NSSet?
    
    public var topTenArray: Set<Film> {
        return topTen as? Set<Film> ?? []}
    
    public var nameW: String {return name ?? "" }
    public var categoryW: String {return category ?? "" }
    

}

// MARK: Generated accessors for topTen
extension User {

    @objc(addTopTenObject:)
    @NSManaged public func addToTopTen(_ value: Film)

    @objc(removeTopTenObject:)
    @NSManaged public func removeFromTopTen(_ value: Film)

    @objc(addTopTen:)
    @NSManaged public func addToTopTen(_ values: NSSet)

    @objc(removeTopTen:)
    @NSManaged public func removeFromTopTen(_ values: NSSet)

}

extension User : Identifiable {

}
