//
//  appData.swift
//  Kino_App03
//
//  Created by jose francisco morales on 16/11/2020.
//

import Foundation

class AppData: ObservableObject {
   @Published var movieDetailToShow: Int? = nil
   @Published var personDetailToShow: Int? = nil
    @Published var myList: [Movie] = []
    
    @Published var showingVideoPlayer = false
    
    
}
