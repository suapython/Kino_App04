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

class UserDBVM: ObservableObject {
    
    
    @Published var users: [User] = []

    
    init() {
        fetchAllUsers()
    }

     
    func fetchAllUsers() {
        
        self.users = CoreDataManager.shared.getAllUsers().sorted(by: { (user1, user2) -> Bool in
            user1.nameW < user2.nameW
        })
        .filter{ $0.nameW != ""}
    }
    
    func deleteUser(_ user: User) {
        CoreDataManager.shared.deleteUser(name: user.name ?? "")
        fetchAllUsers()
    }
    
    func saveUser(_ user: UserData) {
    CoreDataManager.shared.saveUser(user: user)
    fetchAllUsers()}
    
    
}

 
