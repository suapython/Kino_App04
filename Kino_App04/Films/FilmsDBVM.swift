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
    
    @Published var films = [Film]()

    
    init() {
        fetchAllFilms()
    }

     
    func fetchAllFilms() {
        self.films = CoreDataManager.shared.getAllFilms()
    }
    
    func deleteItem(_ film: Film) {
        CoreDataManager.shared.deleteFilm(title: film.titleW)
        fetchAllFilms()
    }
    
}

 
