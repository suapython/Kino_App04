//
//  UserM.swift
//  Kino_App04
//
//  Created by jose francisco morales on 08/12/2020.
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject {

}

extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var category: String?
    @NSManaged public var image: String?
    @NSManaged public var kino: [Float]?
    @NSManaged public var name: String?
    @NSManaged public var topTen: NSSet?
    
    var topTenArray: [Film] {
        let set = topTen as? Set<Film> ?? []
        return set.sorted {
            $0.movieId < $1.movieId
        }
    }

    
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

 
extension User {
    
    var categoryW: String {return category ?? ""}
    var imageW : String {return image ?? "noimage"}
    var kinoW: [Float] {return kino ?? [0,0,0]}
    var nameW: String {return name ?? ""}
    var topTenArrayW: [Film] { let set = topTen as? Set<Film> ?? []
                               return Array(set)   }
        
}
