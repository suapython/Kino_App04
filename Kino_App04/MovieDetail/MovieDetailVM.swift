//
//  MovieVM.swift
//  Kino_App02
//
//  Created by jose francisco morales on 23/09/2020.
//

import Foundation
import Combine

class MovieDetailVM: ObservableObject, Identifiable  {
    
    var id = UUID()
    var movieId: Int
    
    @Published var movie: Movie = emptyMovie
    
    
    private var disposables = Set<AnyCancellable>()
     
    init(movieId: Int) {
        self.movieId = movieId
        getMovieDetails(movieId: movieId)
        
    }
    
}

extension MovieDetailVM {
   
    
    func getMovieDetails(movieId: Int) {
        let urlComponents = APIClient().makeURLComponents(path: "movie/\(String(movieId))" , queries: ["append_to_response": "keywords,credits,similar,recommendations,release_dates,videos" ])
        print("url components moviedetail", urlComponents.url  )
        APIClient().fetchMovieDetails(with: urlComponents)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .failure(let error): print("Error \(error)")
                    print("failure")
                case .finished:
                  break
                }
              },
              receiveValue: { [weak self] value in
                guard let self = self else { return  }
                self.movie = value
                print(value.videosV)
    
            })
           .store(in: &disposables)
    }
    
    
    
}
