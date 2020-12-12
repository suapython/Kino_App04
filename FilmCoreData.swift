//
//  Film+CoreDataClass.swift
//  Kino_App04
//
//  Created by jose francisco morales on 02/12/2020.
//
//

import Foundation
import CoreData

@objc(Film)
public class Film: NSManagedObject {

}

extension Film {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Film> {
        return NSFetchRequest<Film>(entityName: "Film")
    }

    @NSManaged public var backdrop_path: String?
    @NSManaged public var cast: [String]?
    @NSManaged public var director: [String]?
    @NSManaged public var genres: [String]?
    @NSManaged public var keywords: [String]?
    @NSManaged public var movieId: Int32
    @NSManaged public var popularity: Float
    @NSManaged public var poster_path: String?
    @NSManaged public var recommendations: [String]?
    @NSManaged public var similar: [String]?
    @NSManaged public var title: String?
    @NSManaged public var vote_average: Float
    @NSManaged public var year: String?
    @NSManaged public var topTen: NSSet?

}

// MARK: Generated accessors for topTen
extension Film {

    @objc(addTopTenObject:)
    @NSManaged public func addToTopTen(_ value: User)

    @objc(removeTopTenObject:)
    @NSManaged public func removeFromTopTen(_ value: User)

    @objc(addTopTen:)
    @NSManaged public func addToTopTen(_ values: NSSet)

    @objc(removeTopTen:)
    @NSManaged public func removeFromTopTen(_ values: NSSet)

}

extension Film : Identifiable {

}

extension Film {

    var movieIdW: Int {return Int(movieId)}
    var popularityW: Float {return popularity}
    var titleW: String {return title ?? "N/A"}
    var vote_averageW: Float {return vote_average}
    var yearW: String {return year ?? "N/A"}
    var poster_pathW: String {return poster_path ?? "N/A"}
    var backdrop_pathW: String {return backdrop_path ?? "N/A"}
    var castW: [String] {return cast ?? []}
    var directorW: [String] {return director ?? []}
    var genresW: [String] {return genres ?? []}
    var keywordsW: [String] {return keywords ?? []}
    var similarW: [String] {return similar ?? []}
    var recommendationsW: [String] {return recommendations ?? []}

}
