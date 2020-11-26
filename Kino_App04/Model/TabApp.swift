//
//  TabApp.swift
//  Kino_App03
//
//  Created by jose francisco morales on 21/11/2020.
//

import Foundation

enum TabApp: Tab {
    case home
    case search
    case myList
    
    func title() -> String {
        switch self {
        case .home:
            return "Home"
        case .search:
            return "Search"
        case .myList:
            return "My List"
            
        }
    }
    
}
