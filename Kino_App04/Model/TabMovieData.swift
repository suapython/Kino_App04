//
//  MovieTab.swift
//  Kino_App02
//
//  Created by jose francisco morales on 10/11/2020.
//

import Foundation

enum TabMovieData: Tab {
    case cast
    case recommend
    case similar
    
    func title() -> String {
        switch self {
        case .cast:
            return "Cast"
        case .recommend:
            return "Recommend"
        case .similar:
            return "Similar"
            
        }
    }
   
}
