//
//  FilmM.swift
//  Kino_App04
//
//  Created by jose francisco morales on 08/12/2020.
//

import Foundation

struct FilmM: Hashable {

    var movieId: Int
    var popularity: Float
    var poster_path: String
    var backdrop_path: String
    var title: String
    var vote_average: Float
    var year: String
    var cast: [String]
    var director: [String]
    var similar: [String]
    var recommendations: [String]
    var keywords: [String]
    var genres: [String]


    init(film: Film) {
        self.movieId = Int(film.movieId)
        self.popularity = film.popularity
        self.title = film.title ?? "N/A"
        self.vote_average = film.vote_average ?? 0
        self.year = film.year ?? "N/A"
        self.poster_path = film.poster_path ?? "N/A"
        self.backdrop_path = film.backdrop_path ?? "N/A"
        self.cast = film.cast ?? []
        self.director = film.director ?? []
        self.genres = film.genres ?? []
        self.keywords = film.keywords ?? []
        self.similar = film.similar ?? []
        self.recommendations = film.recommendations ?? []
    }
}
