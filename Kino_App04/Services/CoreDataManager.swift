//
//  CoreDataManager.swift
//  Kino_App04
//
//  Created by jose francisco morales on 27/11/2020.
//

import Foundation
import UIKit
import CoreData
import SwiftUI

 


public class CoreDataManager {
        
    static let shared = CoreDataManager(moc: PersistentContainer.context)
    
    var moc: NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext) {
        self.moc = moc
    }
    
    private func fetchFilm(title: String) -> Film? {
        
        var films = [Film]()
        
        let request: NSFetchRequest<Film> = Film.fetchRequest()
        request.predicate = NSPredicate(format: "title == %@", title)
        
        do {
            films = try self.moc.fetch(request)
        } catch let error as NSError {
            print(error)
        }
        
        return films.first
        
    }
    
    func deleteFilm(title: String) {
        
        do {
            if let film = fetchFilm(title: title) {
                self.moc.delete(film)
                try self.moc.save()
            }
        } catch let error as NSError {
            print(error)
        }
        
    }
    
    
    func getAllFilms() -> [Film] {
        
        var films = [Film]()
        
        let filmRequest: NSFetchRequest<Film> = Film.fetchRequest()
        
        do {
            films = try self.moc.fetch(filmRequest)
        } catch let error as NSError {
            print(error)
        }
        
        return films
        
    }
    
    func saveFilm(movie: Movie) {
        
        let film = Film(context: self.moc)
        film.title = movie.title
        film.movieId = Int32(movie.movieId)
        film.vote_average = movie.vote_average
        film.year = movie.year
        film.poster_path = movie.poster_path
        
        film.castArray = []
        for item in movie.cast {
            film.castArray!.append(item.name)
                 }
        
        for item in movie.cast {
            let newCast = PersonD(context: self.moc)
            newCast.name = item.name
            newCast.personId = Int32(item.id)
            newCast.popularity = item.popularity ?? 0
            newCast.setValue(NSSet(object: film), forKey: "cast")
            mocSave()   }
        
        for item in movie.directors {
            let newDirector = PersonD(context: self.moc)
            newDirector.name = item.name
            newDirector.personId = Int32(item.id)
            newDirector.popularity = item.popularity ?? 0
            newDirector.setValue(NSSet(object: film), forKey: "director")
            mocSave()   }
        
        for item in movie.genresM {
            let newGenre = GenreD(context: self.moc)
            newGenre.name = item.name
            newGenre.id = Int32(item.id)
            newGenre.setValue(NSSet(object: film), forKey: "genre")
            mocSave()   }
        
        for item in movie.keywordsM {
            let newKeyword = KeywordsD(context: self.moc)
            newKeyword.name = item.name
            newKeyword.id = Int32(item.id)
            newKeyword.setValue(NSSet(object: film), forKey: "keywords")
            mocSave()        }
        
        for item in movie.similarM.movies {
            let newSimilar = Film(context: self.moc)
            newSimilar.title = item.title
            newSimilar.movieId = Int32(item.movieId)
            newSimilar.setValue(NSSet(object: film), forKey: "similar")
            mocSave()        }
       
        for item in movie.recommendationsM.movies {
            let newSimilar = Film(context: self.moc)
            newSimilar.title = item.title
            newSimilar.movieId = Int32(item.movieId)
            newSimilar.setValue(NSSet(object: film), forKey: "recommendations")
            mocSave()        }
        
        
        
    }
    
    func mocSave() {
        do {
            try self.moc.save()
        } catch let error as NSError {
            print(error)
        }
    }

    

    
}


struct PreviewCoreDataWrapper<Content: View>: View {
  let content: (NSManagedObjectContext) -> Content

  var body: some View {
    let managedObjectContext =  PersistentContainer.persistentContainer.viewContext

    let film = Film(context: managedObjectContext)
    film.title = "I Am Legend"
    film.movieId = 100

    return self.content(managedObjectContext)
  }

    init(@ViewBuilder content: @escaping (NSManagedObjectContext) -> Content) {
        self.content = content
      }
    
}




func getCoreDataDBPath() {
        let path = FileManager
            .default
            .urls(for: .applicationSupportDirectory, in: .userDomainMask)
            .last?
            .absoluteString
            .replacingOccurrences(of: "file://", with: "")
            .removingPercentEncoding

        print("Core Data DB Path :: \(path ?? "Not found")")
    }

