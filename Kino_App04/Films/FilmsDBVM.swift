//
//  FilmsVM.swift
//  Kino_App04
//
//  Created by jose francisco morales on 27/11/2020.
//

import Foundation
import SwiftUI
import CoreData
import Combine

class FilmsDBVM: ObservableObject {
    
    @Published var films = [FilmM]()

    
    init() {
        fetchAllFilms()
    }

     
    func fetchAllFilms() {
        self.films = CoreDataManager.shared.getAllFilms().map(FilmM.init)
    }
    
    func deleteItem(_ film: FilmM) {
        CoreDataManager.shared.deleteFilm(title: film.title)
        fetchAllFilms()
    }
    
}

 
