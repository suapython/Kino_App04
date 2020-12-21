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

class UserDBDetailsVM: ObservableObject {
    
    let user: User
    @Published var films: [Film] = []

    
    init(user: User) {
        self.user = user
        films = user.topTenArray != [] ? user.topTenArray : user.topTenW
    }


    
    func deleteFilm(film: Film) {
        CoreDataManager.shared.deleteFilm(title: film.titleW, user: user)
        films = user.topTenArray.filter{ $0 != film}
    }
    
     
    
    
     
    
}

 
