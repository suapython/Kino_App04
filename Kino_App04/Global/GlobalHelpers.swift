//
//  GlobalHelpers.swift
//  Kino_App02
//
//  Created by jose francisco morales on 27/09/2020.
//

import Foundation
import SwiftUI

 var exampleMovie = Movie(id: 724989,
                          original_title: "Hard Kill",
                          title: "Hard Kill",
                          overview: "The work of billionaire tech CEO Donovan Chalmers is so valuable that he hires mercenaries to protect it, and a terrorist group kidnaps his daughter just to get it.",
                          poster_path: "/ugZW8ocsrfgI95pnQ7wrmKDxIe.jpg",
                          backdrop_path:  "/86L8wqGMDbwURPni2t7FQ0nDjsH.jpg",
                          popularity: 1188.534,
                          vote_average: 5.0,
                          vote_count: 152,
                          runtime:  98,
                          release_date:  "2020-10-23",
                          production_countries:  [productionCountry(name:" United States of America")],
                          genres: [Genre(id: 28, name: "Action"), Genre(id: 53, name: "Thriller")],
                          similar: MovieResponse(movies: []),
                          recommendations: MovieResponse(movies: []),
                          credits: Credits(cast: [CastItem(id: 62, character: "Chalmers", name: "Bruce Willis", profile_path:  "/A1XBu3CffBpSK8HEIJM8q7Mn4lz.jpg", popularity: 0)],
                                           crew: [CrewItem(id: 17210, name: "George Furla", job: "Producer", popularity: 0)]),
                          release_dates: ReleaseDates(results: [ReleaseDate(iso_3166_1: "US", release_dates: [Certification(certification: "MA15+")])]),
                          videos: VideoResponse(results: [
                                                    Videos(id: "5dad5e43ae366800129b1caf",
                                                          iso_639_1: "en",
                                                          iso_3166_1: "US",
                                                          key: "vOUVVDWdXbo",
                                                          name: "BLOODSHOT - Official Trailer (HD)",
                                                          site: "YouTube",
                                                          size: 1080,
                                                          type: "Trailer")]))


var exampleMovie2 = Movie(id: 11030,
                         original_title: "Zelig",
                         title: "Zelig",
                         overview: "The ....",
                         poster_path: "/ugZW8ocsrfgI95pnQ7wrmKDxIe.jpg",
                         backdrop_path:  "/86L8wqGMDbwURPni2t7FQ0nDjsH.jpg",
                         popularity: 1188.534,
                         vote_average: 5.0,
                         vote_count: 152,
                         runtime: 0
                          )



var exampleCastItem1 = CastItem(id: 62, character: "Chalmers", name: "Bruce Willis", profile_path:  "/A1XBu3CffBpSK8HEIJM8q7Mn4lz.jpg", popularity: 0)
    

var emptyMovie = Movie(
                        id: 0,
   
                        original_title: "",
                        title: " ",
                        overview: " ",
                        poster_path: " ",
                        backdrop_path: " ",
                        popularity: 0,
                        vote_average: 0,
                        vote_count: 0,
                        runtime: 0,
                        release_date: "2000-01-01",
                        production_countries: [],
                        genres:  [ ],
                        similar: MovieResponse(movies: []),
                       recommendations: MovieResponse(movies: []),
    credits: Credits(cast: [ ],crew: [ ]),
    release_dates: ReleaseDates(
        results: [ ReleaseDate(iso_3166_1: "US",
                               release_dates:
                                 [Certification(certification: "R" )] )]  )
    )


var examplePerson1 = Person(id: 1243, name: "Woody Allen", biography:"Woody Allen (born Allen Stewart Konigsberg; December 1, 1935)", deathday: nil, birthday: "1935-12-01", known_for_department:  "Directing", popularity: 0, profile_path:  "/wcPQgZLDibuej1RwNTy1R2U2ZJw.jpg")

 
var emptyPerson = Person(id: 1243, name: " ", biography:" ", deathday: nil, birthday: " ", known_for_department:  "", popularity: 0, profile_path:  "")

var exampleUser = User(context: managedObjectContext)
 

 

extension LinearGradient {
    static let blackOpacityGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.95)]),
        startPoint: .top,
        endPoint: .bottom)
        
    static let  blackOpacityGradientUp = LinearGradient(
            gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.70)]),
            startPoint: .bottom,
            endPoint: .top)
}

enum ImagePath: String {
    case small = "https://image.tmdb.org/t/p/w154/"
    case medium = "https://image.tmdb.org/t/p/w500/"
    case cast = "https://image.tmdb.org/t/p/w185/"
    case original = "https://image.tmdb.org/t/p/original/"
    
    func path(poster: String) -> URL {
        return URL(string: rawValue)!.appendingPathComponent(poster)
    }
}

var noimage = "https://i.pinimg.com/736x/b1/1f/59/b11f5986d58a69ed610e819e261b0f16.jpg"

extension String {
   func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

let Klogo: some View =     Image("redk")
                             .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                     

let exampleVideoURL =   "https://bit.ly/swswift"
let exampleImageURL =  "https://picsum.photos/300/104"

let managedObjectContext = PersistentContainer.persistentContainer.viewContext



let red = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
let green = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
let blue = UIColor(red: 0, green: 0, blue: 1, alpha: 1)
let col2 = UIColor(hue: 0, saturation: 0.66, brightness: 0.66, alpha: 1)
let col3 = UIColor(hue: 0.25, saturation: 0.66, brightness: 0.66, alpha: 1)
let col4 = UIColor(hue: 0.5, saturation: 0.66, brightness: 0.66, alpha: 1)
let col5 = UIColor(hue: 0.75, saturation: 0.66, brightness: 0.66, alpha: 1)
