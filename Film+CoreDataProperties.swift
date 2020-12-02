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
    @NSManaged public var title: String?
    @NSManaged public var vote_average: Float
    @NSManaged public var year: String?
    @NSManaged public var castArray: [String]?
    @NSManaged public var cast: NSSet?
    @NSManaged public var director: NSSet?
    @NSManaged public var genre: NSSet?
    @NSManaged public var keywords: NSSet?
    @NSManaged public var recommendations: NSSet?
    @NSManaged public var similar: NSSet?
    
    public var titleW: String {return title ?? "N/A"}
    public var vote_averageW: Float {return vote_average ?? 0}
    public var yearW: String {return year ?? "N/A"}
    public var poster_pathW: String {return poster_path ?? "N/A"}
    
    
    
    
    public var castW: [PersonD] {
                let set = cast as? Set<PersonD> ?? []
                return set.sorted {
                    $0.nameW < $1.nameW
                }
            }
    public var directorW: [PersonD] {
            let set = director as? Set<PersonD> ?? []
            return set.sorted {
                $0.nameW < $1.nameW
            }
        }
    public var genreW: [GenreD] {
            let set = genre as? Set<GenreD> ?? []
            return set.sorted {
                $0.nameW < $1.nameW
            }
        }
    public var keywordsW: [KeywordsD] {
            let set = keywords as? Set<KeywordsD> ?? []
            return set.sorted {
                $0.nameW < $1.nameW
            }
        }
    public var similarW: [Film] {
            let set = similar as? Set<Film> ?? []
            return set.sorted {
                $0.titleW < $1.titleW
            }
        }
    public var recommendationsW: [Film] {
            let set = recommendations as? Set<Film> ?? []
            return set.sorted {
                $0.titleW < $1.titleW
            }
        }



}

// MARK: Generated accessors for cast
extension Film {

    @objc(addCastObject:)
    @NSManaged public func addToCast(_ value: PersonD)

    @objc(removeCastObject:)
    @NSManaged public func removeFromCast(_ value: PersonD)

    @objc(addCast:)
    @NSManaged public func addToCast(_ values: NSSet)

    @objc(removeCast:)
    @NSManaged public func removeFromCast(_ values: NSSet)

}

// MARK: Generated accessors for director
extension Film {

    @objc(addDirectorObject:)
    @NSManaged public func addToDirector(_ value: PersonD)

    @objc(removeDirectorObject:)
    @NSManaged public func removeFromDirector(_ value: PersonD)

    @objc(addDirector:)
    @NSManaged public func addToDirector(_ values: NSSet)

    @objc(removeDirector:)
    @NSManaged public func removeFromDirector(_ values: NSSet)

}

// MARK: Generated accessors for genre
extension Film {

    @objc(addGenreObject:)
    @NSManaged public func addToGenre(_ value: GenreD)

    @objc(removeGenreObject:)
    @NSManaged public func removeFromGenre(_ value: GenreD)

    @objc(addGenre:)
    @NSManaged public func addToGenre(_ values: NSSet)

    @objc(removeGenre:)
    @NSManaged public func removeFromGenre(_ values: NSSet)

}

// MARK: Generated accessors for keywords
extension Film {

    @objc(addKeywordsObject:)
    @NSManaged public func addToKeywords(_ value: KeywordsD)

    @objc(removeKeywordsObject:)
    @NSManaged public func removeFromKeywords(_ value: KeywordsD)

    @objc(addKeywords:)
    @NSManaged public func addToKeywords(_ values: NSSet)

    @objc(removeKeywords:)
    @NSManaged public func removeFromKeywords(_ values: NSSet)

}

// MARK: Generated accessors for recommendations
extension Film {

    @objc(addRecommendationsObject:)
    @NSManaged public func addToRecommendations(_ value: Film)

    @objc(removeRecommendationsObject:)
    @NSManaged public func removeFromRecommendations(_ value: Film)

    @objc(addRecommendations:)
    @NSManaged public func addToRecommendations(_ values: NSSet)

    @objc(removeRecommendations:)
    @NSManaged public func removeFromRecommendations(_ values: NSSet)

}

// MARK: Generated accessors for similar
extension Film {

    @objc(addSimilarObject:)
    @NSManaged public func addToSimilar(_ value: Film)

    @objc(removeSimilarObject:)
    @NSManaged public func removeFromSimilar(_ value: Film)

    @objc(addSimilar:)
    @NSManaged public func addToSimilar(_ values: NSSet)

    @objc(removeSimilar:)
    @NSManaged public func removeFromSimilar(_ values: NSSet)

}

extension Film : Identifiable {

}
