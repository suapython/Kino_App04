//
//  CustomTab.swift
//  Kino_App02
//
//  Created by jose francisco morales on 31/10/2020.
//

import Foundation


enum TabSearch: String, Tab {
        case movie = "Movie"
        case person = "Person"
    
    func title() -> String {
        switch self {
        case .movie:
            return "Movie"
        case .person:
            return "Person"
            
        }
    }
}
    
