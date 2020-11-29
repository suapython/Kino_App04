//
//  CustomTab.swift
//  Kino_App02
//
//  Created by jose francisco morales on 31/10/2020.
//

import Foundation


enum TabDBSearch: String, Tab {
        case movies, users
    
    func title() -> String {
        switch self {
        case .movies:
            return "Movies"
        case .users:
            return "Users"
            
        }
    }
}
    
