//
//  MovieDetailResponse.swift
//  Kino_App02
//
//  Created by jose francisco morales on 12/11/2020.
//

import Foundation
import SwiftUI

// MARK:   PersonDetail

struct PersonResponse: Decodable {
    let people: [Person]

    enum CodingKeys: String, CodingKey {
        case people = "results"
    }
}

struct Person: Decodable, Identifiable {
    
    var id: Int 
    var personId: Int {return id}
    var name: String
    var biography: String?
    var biographyP: String {return biography ?? "" }
    var deathday: String?
    var birthday: String?
    var known_for_department: String
    var known_for_departmentP: String {return known_for_department == "Directing" ? "Director" : "Actor"}
    var job: String {return known_for_department == "Directing" ? "Director" : "Actor"}
    var place_of_birth: String?
    var popularity: Float?
    var profile_path: String?
    var profile_pathP: String { return profile_path ?? noimage }
    var movie_credits: PersonCredits? = PersonCredits(cast:[],crew:[])
    
     
}

struct PersonCredits: Decodable {
    var cast: [PersonCastItem]
    var crew: [PersonCastItem]
    var castcrew: [PersonCastItem] {return   cast+crew }
   
}

struct PersonCastItem: Decodable, Hashable  {
    
     
   // var id = UUID()
    var movieId: Int
    var original_title: String = ""
    var title: String = ""
    var userTitle: String {
        return AppUserDefaults.alwaysOriginalTitle ? original_title : title
    }

    var overview: String = ""
    var poster_path: String? = noimage
    var backdrop_path: String? =  noimage
    var popularity: Float? = 0
    var popularityP: Float {return popularity ?? 0}
    var vote_average: Float = 0
    var vote_count: Int = 0

    var release_date: String? = "2000-01-01"
    var year: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.date(from: release_date ?? "0000")
        formatter.dateFormat = "yyyy"
        return formatter.string(from: date ?? Date() )
    }
    
    enum CodingKeys: String, CodingKey {
       case movieId = "id"
        case original_title,title,overview,poster_path,backdrop_path,popularity,vote_average,release_date,vote_count 
    }
    
    
}

 
