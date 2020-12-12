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

class LoginFormVM: ObservableObject {
    
    @Published var users: [User] = []

    
    init() {
        fetchAllUsers()
        
        
    }

     
    func fetchAllUsers() {
        self.users = CoreDataManager.shared.getAllUsers()
    }
    
    func deleteUser(_ user: User) {
        CoreDataManager.shared.deleteUser(name: user.name ?? "")
        fetchAllUsers()
    }
    
    
   
    
    
    
}

 
