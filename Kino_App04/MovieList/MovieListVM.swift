//
//  MovieVM.swift
//  Kino_App02
//
//  Created by jose francisco morales on 23/09/2020.
//

import Foundation
import Combine
import SwiftUI

class MovieListVM: ObservableObject {
    
    @Published var movies: [TabCategory: [Movie]] = [:]
    var allCategories: [TabCategory] = [.popular, .topRated,.trending, .upcoming, .nowPlaying ]
    
    @Published var viewState: ViewState = ViewState.standby
    
    private var disposables = Set<AnyCancellable>()
    
    init() {
        for category in allCategories {
        getMovieList(category: category)
        }
        
    }
    
}

extension MovieListVM {
    
   
    
    func getMovieList(category: TabCategory) {
        let urlComponents = APIClient().makeURLComponents(path: category.path(), queries: [:])
        APIClient().fetchMovie(with: urlComponents)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .failure:
                    self.movies[category] = []
                case .finished:
                  break
                }
              },
              receiveValue: { [weak self] value in
                guard let self = self else { return  }
                self.movies[category] = value.movies
                self.viewState = .ready
                
            })
           .store(in: &disposables)
        
    }
    
    
    
     
    
    
    
}

