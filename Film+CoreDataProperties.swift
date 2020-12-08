//
//  Film+CoreDataProperties.swift
//  Kino_App04
//
//  Created by jose francisco morales on 02/12/2020.
//
//

import Foundation
import CoreData


extension Film {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Film> {
        return NSFetchRequest<Film>(entityName: "Film")
    }

    @NSManaged public var movieId: Int32
    @NSManaged public var popularity: Float
    @NSManaged public var poster_path: String?
    @NSManaged public var backdrop_path: String?
    @NSManaged public var title: String?
    @NSManaged public var vote_average: Float
    @NSManaged public var year: String?
    @NSManaged public var cast: [String]?
    @NSManaged public var director: [String]?
    @NSManaged public var similar: [String]?
    @NSManaged public var recommendations: [String]?
    @NSManaged public var keywords: [String]?
    @NSManaged public var genres: [String]?
    @NSManaged public var user: User?
    
    
    public var titleW: String {return title ?? "N/A"}
    public var vote_averageW: Float {return vote_average ?? 0}
    public var yearW: String {return year ?? "N/A"}
    public var poster_pathW: String {return poster_path ?? "N/A"}
    public var backdrop_pathW: String {return backdrop_path ?? "N/A"}
    
    public var castW: [String] { return (cast ?? [])     }
    public var directorW: [String] { return (director ?? [])   }
    public var genresW: [String] { return (genres ?? [])  }
    public var keywordsW: [String] { return (keywords ?? [])   }
    public var similarW: [String] { return (similar ?? [])   }
    public var recommendationsW: [String] { return (recommendations ?? [])   }
    

}

// MARK: Generated accessors for user
extension Film {

    @objc(addUserObject:)
    @NSManaged public func addToUser(_ value: User)

    @objc(removeUserObject:)
    @NSManaged public func removeFromUser(_ value: User)

    @objc(addUser:)
    @NSManaged public func addToUser(_ values: NSSet)

    @objc(removeUser:)
    @NSManaged public func removeFromUser(_ values: NSSet)

}

extension Film : Identifiable {

}
