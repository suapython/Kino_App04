//
//  CoreDataManager.swift
//  Kino_App04
//
//  Created by jose francisco morales on 27/11/2020.
//

import Foundation
import UIKit
import CoreData

 


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
        
        do {
            try self.moc.save()
        } catch let error as NSError {
            print(error)
        }
        
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
