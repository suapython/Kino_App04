//
//  Movie.swift
//  Kino_App02
//
//  Created by jose francisco morales on 22/09/2020.
//

import Foundation


// MARK:   MovieResponse

struct MovieResponse: Decodable  {
     
    
    let movies: [Movie]

    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

// MARK:   Movie

struct Movie: Decodable, Identifiable, Equatable {
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.movieId == rhs.movieId
    }
    
    let id: Int
    var movieId: Int {return id}
    
    let original_title: String
    let title: String
    var userTitle: String {
        return AppUserDefaults.alwaysOriginalTitle ?  original_title : title
    }
    
    let overview: String
    let poster_path: String?
    var poster_pathM: String {
         poster_path ?? noimage
    }
    let backdrop_path: String?
    var backdrop_pathM: String { return  backdrop_path ?? noimage }
    
    
    let popularity: Float
    let vote_average: Float
    let vote_count: Int
    let runtime: Int?
    var runtimeM: String? {return runtime != nil ? String( runtime!)+"mts" : nil  }
    
    var release_date: String?
    var year: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if release_date == nil {return ""} else {
        let date = formatter.date(from: release_date!)
        formatter.dateFormat = "yyyy"
            return formatter.string(from: date ?? Date() )}
    }
 
    var production_countries: [productionCountry]?
    var production_countriesM: [productionCountry] { return  production_countries ?? [] }
    
    var genres: [Genre]?
    var genresM: [Genre] { return  genres ?? [] }
    
    var similar: MovieResponse?
    var similarM: MovieResponse  { return  similar ?? MovieResponse(movies: []) }
    var recommendations: MovieResponse?
    var recommendationsM: MovieResponse  { return  recommendations ?? MovieResponse(movies: []) }
    var credits: Credits?
    var cast: [CastItem] {return credits?.cast.filter {$0.profile_path != nil} ?? [] }
    var directors: [CrewItem] {return credits?.crew.filter {  $0.job == "Director"} ?? []  }
    
    //var keywords: Keywords?
    
    var release_dates: ReleaseDates?
    
    var MPAA: String? {
    
        let temp = release_dates?.results.filter{($0.iso_3166_1 == "US") || ($0.iso_3166_1 == "IT")}
        
        if temp != nil {
                if !temp!.isEmpty {
                   return  temp![0].release_dates[0].certification
                } else {return nil}
        } else {return nil}
              }
    
    var videos: VideoResponse?
    var videosV: [Videos] { if videos == nil {return []} else
    {return videos!.results.filter{$0.type == "Trailer"}}    }
}

struct VideoResponse: Decodable {
    var results: [Videos]
   
}

struct Videos: Decodable, Hashable {
    var id: String
    var iso_639_1: String
    var iso_3166_1: String
    var key: String
    var name: String
    var site: String
    var size: Int
    var type: String
}
    
   

struct Credits: Decodable {
    var cast: [CastItem]
    var crew: [CrewItem]
    
   
}

struct ReleaseDates: Decodable {
    var results: [ReleaseDate]
}
struct ReleaseDate: Decodable  {
    var iso_3166_1: String
    var release_dates: [Certification]
}
struct Certification: Decodable {
    var certification: String
}




struct Genre: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
}

struct Keywords: Codable {
    let keywords: [Keyword]?
}

struct Keyword: Codable, Identifiable {
    let id: Int
    let name: String
}


struct productionCountry: Codable, Identifiable {
    let id = UUID()
    let name: String
}

 
// MARK:   CastResponse

struct CastResponse: Decodable {
    let cast: [CastItem]
    let crew: [CrewItem]
}

// MARK:   Movie

struct CastItem: Decodable, Identifiable {
    let id: Int
    let character: String
    let name: String
    let profile_path: String?
    
}

struct CrewItem: Decodable, Identifiable {
    let id: Int
    let name: String
    let job: String
    
}







